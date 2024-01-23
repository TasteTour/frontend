import 'package:flutter/material.dart';

import '../../widget/feed_list_item.dart';

class FeedList extends StatelessWidget {
  final List<dynamic> myBoards;
  const FeedList(this.myBoards,{super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: this.myBoards.length,
      itemBuilder: (context, index) {
        return buildPage(myBoards);
      },
    );
  }

  Widget buildPage(List<dynamic> items) {
    return Column(
      children: items.map((item) {
        return FeedListItem(item: item);
      }).toList(),
    );
  }
}