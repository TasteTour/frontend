import 'package:flutter/material.dart';

import '../../widget/comment_item.dart';

class commentBox extends StatelessWidget {
  final List<dynamic> myComments;
  final int onePageBoardCount;
  const commentBox(this.onePageBoardCount, this.myComments, {super.key});

  static int boardsLength = 0;

  void _commentSetting() {
    boardsLength = myComments.length;
  }


  @override
  Widget build(BuildContext context) {
    _commentSetting();
    return buildPages();
  }

  Widget buildPages() {
    return Container(
      height: onePageBoardCount * 50, // TODO 높이는 좀 조정해보세요
      child: PageView.builder(
        itemCount: (myComments.length / onePageBoardCount).ceil(), // 한 페이지에 5개씩 렌더링
        itemBuilder: (context, pageIndex) {
          int startIndex = pageIndex * onePageBoardCount;
          int endIndex = (startIndex + onePageBoardCount < myComments.length) ? startIndex + onePageBoardCount : myComments.length;

          List<dynamic> pageItems = myComments.sublist(startIndex, endIndex);

          return buildPage(pageItems);
        },
      ),
    ); //TODO 넘어갈 버튼
  }

  Widget buildPage(List<dynamic> items) {
    return Column(
      children: items.map((item) {
        // 하나의 글 정보를 전달해서 사용함
        return commentItem(item: item);
      }).toList(),
    );
  }
}
