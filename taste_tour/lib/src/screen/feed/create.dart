import 'package:flutter/material.dart';
import 'package:taste_tour/src/widget/image_button.dart';

class Create extends StatefulWidget {
  const Create({super.key});
  @override
  State<Create> createState() => _CreateState();
}

String _selectedCategory = ''; // 전역 변수로 선언

class _CreateState extends State<Create> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  String _selectedCategory = '한식'; // 초기 카테고리 값은 '한식'
//작성 버튼을 누를때 동작할 함수
  void _submitForm() {
    //현재 폼에서 별다른 오류가 없을때
    if (_formKey.currentState!.validate()) {
      final String title = _titleController.text;
      final String location = _locationController.text;
      final String content = _contentController.text;
      final String category = _categoryController.text;

      //회원가입 로직 추가
      //회원가입 성공 시, 다음 화면 (메인)으로 이동 혹은 처리
    }
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
                  ImageButton(imageUrl: null),
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
                    controller: _titleController,
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
                    controller: _contentController,
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
                      value: _selectedCategory,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCategory = newValue!;
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
                  Text('별점', style: labelTextStyle),
                  StarRating(),
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
                    controller: _locationController,
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

class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          ),
        );
      }),
    );
  }
}
