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
    Map<String, dynamic> body = response.body;
    print(response.bodyString);

    if (body['code'] != 201) {
      throw Exception(body['message']);
    }
    return body['data']['token'];
  }

  // 로그인 통신
  Future sendLogin(String memberEmail, String memberPassword) async {
    Response response = await post('/user/login',
        {'memberEmail': memberEmail, 'memberPassword': memberPassword});
    Map<String, dynamic> body = response.body;
    print("user_connect" + memberEmail + memberPassword);
    print(body['data']['Authorization']);

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data']['Authorization'];
  }

  // 나의 정보 통신
  Future<Map> getMyInfo() async {
    Response response = await get('/api/user/mypage',
        headers: {'Authorization': 'Bearer ${await getToken}'});
    Map<String, dynamic> body = response.body;
    if (body['result'] == 'fail') {
      throw Exception(body['message']);
    }
    return body;
  }

  get getToken async {
    return _storage.read("accessToken");
  }
}
