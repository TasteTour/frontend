import 'package:flutter/material.dart';

import '../../widget/feed_list_item.dart';

class feedBox extends StatelessWidget {
  final List<dynamic> myBoards;
  const feedBox(this.myBoards, {super.key});

  static int boardsLength = 0;

  void _feedSetting() {
    boardsLength = myBoards.length;
  }

  @override
  Widget build(BuildContext context) {
    _feedSetting();
    return buildPages();
  }

  Widget buildPages() {
    return Container(
      height: 595,
      child: PageView.builder(
        itemCount: (myBoards.length / 5).ceil(), // 한 페이지에 5개씩 렌더링
        itemBuilder: (context, pageIndex) {
          int startIndex = pageIndex * 5;
          int endIndex = (startIndex + 5 < myBoards.length) ? startIndex + 5 : myBoards.length;

          List<dynamic> pageItems = myBoards.sublist(startIndex, endIndex);

          return buildPage(pageItems);
        },
      ),
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
