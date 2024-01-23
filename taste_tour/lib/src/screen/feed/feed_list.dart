import 'package:flutter/material.dart';

import '../../widget/feed_list_item.dart';

/**
 * box형태로 사용할 것 같아 FeedBox를 사용하는 게 더 좋을 듯요
 */
@Deprecated("어짜피 전부 box형태로 사용할 것 같아서 필요 없어질 것 같네요.")
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