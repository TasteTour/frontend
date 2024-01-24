import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../shared/global.dart';

final GetStorage _storage = GetStorage();

class FeedConnect extends GetConnect {
  // 최신순으로 글 불러오기
  Future readLatestBoard() async {
    Response response = await get('/board/latest');
    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data'];
  }

  // 인기순으로 글 불러오기
  Future readPopularBoard() async {
    Response response = await get('/board/popular');
    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data'];
  }

  // 내 글 조회하기
  Future readMyBoard() async {
    Response response = await get('/board/my/boards');
    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data'];
  }

  storeItem(String boardTitle, double boardStar, String boardCategory,
      String boardStoreLocation, String boardContent,
      {int? imageId}) async {
    Response response = await post(
      '/board',
      {
        'boardTitle': boardTitle,
        'boardStar': boardStar,
        'boardCategory': boardCategory,
        'boardStoreLocation': boardStoreLocation,
        'boardContent': boardContent,
        if (imageId != null) 'imageId': imageId,
      },
    );
    if (response.statusCode == null) throw Exception('통신 에러');
    Map<String, dynamic> body = response.body;
    if (body['code'] != 201) {
      throw Exception(body['message']);
    }
    return body['message'];
  }

  imageUpload(String name, String path) async {
    final form = FormData({'file': MultipartFile(path, filename: name)});
    Response response = await post('/file/{boardNumber}', form);
    if (response.statusCode == null) throw Exception('통신 에러');
    return response.body;
  }

  /**
   * 일반 함수로 구현
   * 사용 방법 : String token - getToken();
   * String getToken() {
   *  return _Stroage.read('access_token');
   */

  /**
   * Getter로 구현
   * 사용 방법 : String toekn = getToken;
  get getToken async {
    return _storage.read("access_token");
  }
  **/

  /**
   * Getter의 축약 표현
   * 사용 방법 :
   */
  get getToken async {
    return _storage.read('access_token');
  }

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Authorization'] =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7Im1lbWJlck51bWJlciI6MTR9LCJpYXQiOjE3MDYxMDA1NDYsImV4cCI6MTcwNjEyMjE0Nn0.rTQIE6dFJ8i9LIdeDbODnBWlro_HmWMavjjabw02boA";
      // Feed는 어차피 token 다 씀
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }
}
