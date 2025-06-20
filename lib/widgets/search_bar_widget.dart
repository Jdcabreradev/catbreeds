import 'package:catbreeds/state/cat_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    final currentQuery = ref.watch(
      catListProvider.select((state) => state.query),
    );
    final focusNode = ref.watch(focusNodeProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        focusNode: focusNode,
        controller: searchController,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontFamily: "Poppins", color: Colors.grey),
          hintText: "Search cat breeds...",
          prefixIcon: Icon(Icons.search),
          suffixIcon: currentQuery.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    searchController.clear();
                    ref.read(catListProvider.notifier).clearSearch();
                  },
                  icon: Icon(Icons.clear),
                )
              : null,
          border: InputBorder.none,
        ),
        style: TextStyle(fontFamily: "Poppins"),
        textInputAction: TextInputAction.search,
        onSubmitted: (query) =>
            ref.read(catListProvider.notifier).search(query),
        onTapOutside: (_) => focusNode.unfocus(),
      ),
    );
  }
}
