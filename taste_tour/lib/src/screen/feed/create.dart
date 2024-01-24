import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taste_tour/src/controller/feed_controller.dart';
import 'package:taste_tour/src/widget/image_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/global.dart';

final FeedController feedController = Get.put(FeedController());

class Create extends StatefulWidget {
  const Create({super.key});
  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _boardTitleController = TextEditingController();
  final TextEditingController _boardContentController = TextEditingController();
  final TextEditingController _boardStoreLocationController =
      TextEditingController();
  //final TextEditingController _boardCategoryController =
  //   TextEditingController();
  String boardCategory = '한식'; // 초기 카테고리 값은 '한식'
  double boardStar = 0;
  int? fileid;
  final ImagePicker picker = ImagePicker();
//작성 버튼을 누를때 동작할 함수
  void _submitForm() async {
    //현재 폼에서 별다른 오류가 없을때
    if (_formKey.currentState!.validate()) {
      final String boardTitle = _boardTitleController.text;
      final String boardStoreLocation = _boardStoreLocationController.text;
      final String boardContent = _boardContentController.text;
      // final String boardCategory = _boardCategoryController.text;
      print('별점: $boardStar');
      //피드 작성 로직
      /* bool result = await feedController.feedCreate(boardTitle, boardContent,
          boardStoreLocation, boardCategory, boardStar, fileid);
      if (result) {
        Get.back();
      } */
    }
  }

  void uploadImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    /* int id = await feedController.upload(image.name, image.path);
    setState(() {
      fileid = id;
    }); */
  }

  var inputDecoration = InputDecoration(border: OutlineInputBorder());
  var labelTextStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Column(
            children: [
              Text(
                '맛집 등록하기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: _buildSectionWithShadow(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // 이미지 버튼
              Row(
                children: [
                  ImageButton(
                    imageUrl: fileid == null
                        ? null
                        : "${Global.apiRoot}/file/$fileid",
                    onTap: uploadImage,
                  ),
                ],
              ),

              // 이미지 버튼 아래 텍스트
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('사진', style: labelTextStyle),
                  Text(
                    '맛집의 사진을 업로드해보세요.',
                  ),
                ],
              ),

              // 간격 추가
              SizedBox(height: 8),

              // 맛집 이름
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('맛집 이름', style: labelTextStyle),
                  TextFormField(
                    maxLines: 1,
                    decoration: inputDecoration,
                    controller: _boardTitleController,
                  ),
                ],
              ),

              // 간격 추가
              SizedBox(height: 8),

              // 내용
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' 글 내용', style: labelTextStyle),
                  TextFormField(
                    maxLines: 3,
                    decoration: inputDecoration,
                    controller: _boardContentController,
                  ),
                ],
              ),

              // 간격 추가
              SizedBox(height: 8),

              // 카테고리
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('카테고리', style: labelTextStyle),
                  Theme(
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.white,
                    ),
                    child: DropdownButton<String>(
                      value: boardCategory,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          boardCategory = newValue!;
                        });
                      },
                      items: <String>[
                        '한식',
                        '일식',
                        '패스트푸드',
                        '중식',
                        '양식',
                        '아시안',
                        '기타'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

              // 간격 추가
              SizedBox(height: 8),

              // 별점
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (double rating) {
                        print(rating);
                        setState(() {
                          boardStar = rating;
                        });
                      })
                ],
              ),

              // 간격 추가
              SizedBox(height: 8),

              // 위치
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('위치', style: labelTextStyle),
                  TextFormField(
                    maxLines: 1,
                    decoration: inputDecoration,
                    controller: _boardStoreLocationController,
                  ),
                ],
              ),

              // 간격 추가
              SizedBox(height: 50),

              // 등록하기 버튼
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF6363),
                ),
                child: const Text(
                  '등록하기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              // 버튼 끝
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionWithShadow({required Widget child}) {
    return Container(
      margin: const EdgeInsets.all(8), // 변경된 부분: 여백을 추가함
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
