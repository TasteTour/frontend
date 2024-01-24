import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../shared/global.dart';

final GetStorage _storage = GetStorage();

class FeedConnect extends GetConnect {
  // 최신순으로 글 불러오기
  Future readLatestBoard() async {
    Response response =
        await get('/board/latest', headers: {'Authorization': await getToken});

    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data'];
  }

  // 인기순으로 글 불러오기
  Future readPopularBoard() async {
    Response response =
        await get('/board/popular', headers: {'Authorization': await getToken});
    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data'];
  }

  // 내 글 조회하기
  Future readMyBoard() async {
    Response response = await get('/board/my/boards',
        headers: {'Authorization': await getToken});
    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data'];
  }

  Future readBoardCategory(boardCategory) async {
    Response response =
        await get('/board/category', headers: {'boardCategory': boardCategory});

    Map<String, dynamic> body = response.body;

    if (body['code'] != 200) {
      throw Exception(body['message']);
    }
    return body['data'];
  }

  //댓글 생성
  Future commentCreate(int? boardNumber, String commentContent) async {
    Response response = await post('/comment',
        {'commentContent': commentContent, 'boardNumber': boardNumber}, headers: {'Authorization' : await getToken});
    Map<String, dynamic> body = response.body;

    print(body['code']);

    if (body['code'] != 201) {
      throw Exception(body['message']);
    }
    return 1;
  }

  Future commentRead(int? boardNumber) async {
    Response response = await get('/comment/${boardNumber}', headers: {'Authorization' : await getToken});
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

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request) async {
      request.headers['Authorization'] = await getToken;
      // Feed는 어차피 token 다 씀
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  get getToken async {
    return _storage.read("access_token");
  }
}
