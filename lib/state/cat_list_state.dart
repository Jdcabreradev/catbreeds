import 'dart:async';
import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/services/catapi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatListState {
  final List<CatEntity> items;
  final bool isLoading;
  final int page;
  final bool hasMore;
  final String query;
  final String? error;

  const CatListState({
    required this.items,
    required this.isLoading,
    required this.page,
    required this.hasMore,
    required this.query,
    this.error,
  });

  factory CatListState.initial() => const CatListState(
    items: [],
    isLoading: false,
    page: 0,
    hasMore: true,
    query: '',
  );

  CatListState copyWith({
    List<CatEntity>? items,
    bool? isLoading,
    int? page,
    bool? hasMore,
    String? query,
    String? error,
  }) {
    return CatListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      query: query ?? this.query,
      error: error,
    );
  }
}

class CatListNotifier extends StateNotifier<CatListState> {
  final CatAPIService _service;
  final int _limit;
  bool _initialized = false;
  Timer? _searchDebounceTimer;
  String _lastQuery = '';

  CatListNotifier(this._service, [this._limit = 5])
    : super(CatListState.initial()) {
    _initialize();
  }

  @override
  void dispose() {
    _searchDebounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _initialize() async {
    try {
      await loadNextPage();
    } finally {
      if (!_initialized) {
        FlutterNativeSplash.remove();
        _initialized = true;
      }
    }
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasMore || mounted == false) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final nextPage = state.query.isEmpty ? state.page : 0;
      final List<CatEntity> fetched;

      if (state.query.isEmpty) {
        fetched = await _service.fetchBreeds(limit: _limit, page: nextPage);
      } else {
        fetched = await _service.searchBreeds(query: state.query);
      }

      if (!mounted) return;

      final hasMore = state.query.isEmpty && fetched.length == _limit;
      final List<CatEntity> allItems;

      if (state.query.isEmpty) {
        allItems = [...state.items, ...fetched];
      } else {
        allItems = fetched;
      }

      state = state.copyWith(
        items: allItems,
        isLoading: false,
        page: state.query.isEmpty ? nextPage + 1 : 0,
        hasMore: hasMore,
      );
    } catch (e) {
      if (mounted) {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }
  }

  void searchWithDebounce(
    String query, {
    Duration delay = const Duration(milliseconds: 300),
  }) {
    _searchDebounceTimer?.cancel();
    _searchDebounceTimer = Timer(delay, () => search(query));
  }

  Future<void> search(String query) async {
    final trimmedQuery = query.trim();
    if (_lastQuery == trimmedQuery) return;

    _lastQuery = trimmedQuery;
    state = CatListState.initial().copyWith(query: trimmedQuery);
    await loadNextPage();
  }

  Future<void> clearSearch() async {
    _searchDebounceTimer?.cancel();
    _lastQuery = '';
    state = CatListState.initial();
    await loadNextPage();
  }

  Future<void> refresh() async {
    final currentQuery = state.query;
    state = CatListState.initial().copyWith(query: currentQuery);
    await loadNextPage();
  }

  void retry() {
    if (state.error != null) {
      loadNextPage();
    }
  }
}

final catListProvider = StateNotifierProvider<CatListNotifier, CatListState>((
  ref,
) {
  final service = ref.watch(catAPIServiceProvider);
  return CatListNotifier(service);
});

final scrollControllerProvider = Provider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();

  void onScroll() {
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - 200) {
      ref.read(catListProvider.notifier).loadNextPage();
    }
  }

  controller.addListener(onScroll);

  ref.onDispose(() {
    controller.removeListener(onScroll);
    controller.dispose();
  });

  return controller;
});

final searchControllerProvider = Provider.autoDispose<TextEditingController>((
  ref,
) {
  final controller = TextEditingController();

  void onSearch() {
    ref.read(catListProvider.notifier).searchWithDebounce(controller.text);
  }

  controller.addListener(onSearch);

  ref.onDispose(() {
    controller.removeListener(onSearch);
    controller.dispose();
  });

  return controller;
});

final catAPIServiceProvider = Provider<CatAPIService>((ref) => CatAPIService());

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(catListProvider.select((state) => state.isLoading));
});

final hasErrorProvider = Provider<bool>((ref) {
  return ref.watch(catListProvider.select((state) => state.error != null));
});

final catItemsProvider = Provider<List<CatEntity>>((ref) {
  return ref.watch(catListProvider.select((state) => state.items));
});
