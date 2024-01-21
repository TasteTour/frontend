import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../shared/global.dart';

// 회원 관련된 통신을 담당하는 클래스
class UserConnect extends GetConnect {
  final GetStorage _storage = GetStorage();
  // 회원가입 통신
  Future sendRegister(String email, String name, String password) async {
    Response response = await post('/api/user/register', {
      'email': email,
      'name': name,
      'password': password,
    });

    Map<String, dynamic> body = response.body;

    if (body['result'] == 'fail') {
      throw Exception(body['message']);
    }
    return body['access_token'];
  }

  // 로그인 통신
  Future sendLogin(String email, String password) async {
    Response response =
        await post('/api/user/login', {'email': email, 'password': password});
    Map<String, dynamic> body = response.body;

    if (body['result'] == 'fail') {
      throw Exception(body['message']);
    }
    return body['access_token'];
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
}
