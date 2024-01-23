import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../shared/global.dart';

final GetStorage _storage = GetStorage();

class FeedConnect extends GetConnect {

  // 내 글 조회하기
  Future readMyBoard() async {
    Response response = await get('/board/my/boards', headers: {'Authorization' : await getToken});
    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data'];
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

  get getToken async {
    return _storage.read("access_token");
  }
}