import 'dart:ffi';

class FeedModel {
  FeedModel(){

  }

  int? boardNumber;
  String? boardTitle;
  double? boardStar;
  String? boardCategory;
  String? boardStoreLocation;
  String? boardContent;
  int? boardViews;
  String? boardCreated;
  String? boardUpdated;
  int? boardComment;
  int? memberNumber;
  String? memberName;

  FeedModel.fromJson(Map m) {
    /*
    이름이 있는 생성자
    {
      "id" :1,
      "name": "홍길동",
      "email": "hello@korea.com"
    }
      이런식의 jsonData (map)을 클래스에 멤버변수들에게 초기화 해준다.
     */

    boardNumber = m['boardNumber'];
    boardTitle = m['boardTitle'];
    boardStar = m['boardStar'];
    boardCategory = m['boardCategory'];
    boardStoreLocation = m['boardStoreLocation'];
    boardContent = m['boardContent'];
    boardViews = m['boardViews'];
    boardCreated = m['boardCreated'];
    boardUpdated = m['boardUpdated'];
    boardComment = m['boardComment'];
    memberNumber = m['memberNumber'];
    memberName = m['memberName'];
  }
}