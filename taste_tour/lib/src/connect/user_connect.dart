import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../shared/global.dart';

final GetStorage _storage = GetStorage();

// 회원 관련된 통신을 담당하는 클래스
class UserConnect extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  // 회원가입 통신
  Future sendRegister(String memberName, String memberEmail, String memberPhone,
      String memberPassword) async {
    print("user_connect" +
        memberName +
        memberEmail +
        memberPassword +
        memberPhone);
    Response response = await post(
      '/user/register',
      {
        'memberName': memberName,
        'memberEmail': memberEmail,
        'memberPhone': memberPhone,
        'memberPassword': memberPassword
      },
    );
    // Map<String, dynamic> body = response.body;
    print(response.bodyString);

    // _storage.write("memberName", body['data']['memberName']);
    // _storage.write("memberEmail", body['data']['memberEmail']);
    // _storage.write("memberPhone", body['data']['memberPhone']);

    // if (body['code'] != 201) {
    //   throw Exception(body['message']);
    // }
    // return body['data']['token'];
  }

  // 로그인 통신
  Future sendLogin(String memberEmail, String memberPassword) async {
    Response response = await post('/user/login',
        {'memberEmail': memberEmail, 'memberPassword': memberPassword});
    Map<String, dynamic> body = response.body;
    print("user_connect" + memberEmail + memberPassword);
    print(body['data']['Authorization']);

    _storage.write("memberName", body['data']['memberName']);
    _storage.write("memberEmail", body['data']['memberEmail']);
    _storage.write("memberPhone", body['data']['memberPhone']);

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data']['Authorization'];
  }

  // 비밀번호 변경하기
  Future updatePassword(String lastMemberPassword, String memberPassword) async {
    Response response = await get('/user/mypage/change/password',
        headers: {
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7Im1lbWJlck51bWJlciI6MTMsIm1lbWJlck5hbWUiOiLsobDtmJXspIAifSwiaWF0IjoxNzA2MTA5MDEzLCJleHAiOjE3MDYxMzA2MTN9.iHB6U6rby-dq3eE6ALu9DzaO8MgbZvdE2jhK7oRwzNM',
          'lastMemberPassword': lastMemberPassword, 'memberPassword': memberPassword });
    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    print(body['data']);
    // return body['data'];
  }

  get getToken async {
    return _storage.read("access_token");
  }
}
