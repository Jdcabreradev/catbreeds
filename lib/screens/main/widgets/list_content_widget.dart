import 'package:catbreeds/screens/main/widgets/empty_widget.dart';
import 'package:catbreeds/state/cat_list_state.dart';
import 'package:catbreeds/screens/main/widgets/cat_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListContentWidget extends ConsumerWidget {
  const ListContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(catListProvider);
    final scrollController = ref.watch(scrollControllerProvider);

    // Empty State
    if (!state.isLoading && state.items.isEmpty) {
      return EmptyWidget();
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: ListView.builder(
        controller: scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount:
            state.items.length +
            (state.hasMore ? 1 : 0) +
            (state.error != null ? 1 : 0),
        itemBuilder: (context, index) {
          // Loading item
          if (index >= state.items.length) {
            return Center(
              child: const CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.grey,
              ),
            );
          }

          // Cat item
          return CatItemWidget(
            cat: state.items[index],
            heroTag: 'cat-profile-$index',
          );
        },
      ),
    );
  }
}
