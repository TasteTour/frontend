/**
 * "commentNumber": 14,
    "memberNumber": 4,
    "boardNumber": 12,
    "commentContent": "안녕하세요",
    "commentCreated": "2024-01-24T18:05:16.000Z",
 */
class CommentModel {
  CommentModel(){
  }

  int? commentNumber;
  int? memberNumber;
  String? memberName;
  int? boardNumber;
  String? commentContent;
  String? commentCreated;

  CommentModel.fromJson(Map m) {
    /*
    이름이 있는 생성자
    {
      "id" :1,
      "name": "홍길동",
      "email": "hello@korea.com"
    }
      이런식의 jsonData (map)을 클래스에 멤버변수들에게 초기화 해준다.
     */

    commentNumber = m['commentNumber'];
    memberNumber = m['memberNumber'];
    memberName = m['memberName'];
    boardNumber = m['boardNumber'];
    commentContent = m['commentContent'];
    commentCreated = m['commentCreated'];
    commentCreated = commentCreated?.substring(0, commentCreated?.indexOf("T"));
  }
}