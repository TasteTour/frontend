import 'package:flutter/material.dart';

import '../../widget/feed_list_item.dart';

class feedBox extends StatelessWidget {
  final List<dynamic> myBoards;
  final int onePageBoardCount;
  const feedBox(this.onePageBoardCount, this.myBoards, {super.key});

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
      height: onePageBoardCount * 116, // TODO 높이는 좀 조정해보세요
      child: PageView.builder(
        itemCount: (myBoards.length / onePageBoardCount).ceil(), // 한 페이지에 5개씩 렌더링
        itemBuilder: (context, pageIndex) {
          int startIndex = pageIndex * onePageBoardCount;
          int endIndex = (startIndex + onePageBoardCount < myBoards.length) ? startIndex + onePageBoardCount : myBoards.length;

          List<dynamic> pageItems = myBoards.sublist(startIndex, endIndex);

          return buildPage(pageItems);
        },
      ),
    ); //TODO 넘어갈 버튼
  }

  Widget buildPage(List<dynamic> items) {
    return Column(
      children: items.map((item) {
        // 하나의 글 정보를 전달해서 사용함
        return FeedListItem(item: item);
      }).toList(),
    );
  }
}
