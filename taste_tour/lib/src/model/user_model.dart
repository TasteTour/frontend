class UserModel {
  int? id;
  String? name;
  String? email;

  UserModel.fromJason(Map m) {
    /* 
    이름이 있는 생성자
    {
      "id" :1,
      "name": "홍길동",
      "email": "hello@korea.com"
    }
      이런식의 jsonData (map)을 클래스에 멤버변수들에게 초기화 해준다.
     */

    id = m['id'];
    name = m['name'];
    email = m['email'];
  }
}
