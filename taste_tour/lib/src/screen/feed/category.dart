import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taste_tour/src/controller/feed_controller.dart';
import 'package:taste_tour/src/screen/feed/category_feed.dart';
import 'package:taste_tour/src/screen/feed/search_feed.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final feedController = Get.put(FeedController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();

  _submitForm() async {
    if (_formkey.currentState!.validate()) {
      final String searchKeyword = _searchController.text;

      if(await feedController.searchBoard(searchKeyword) == null){
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text("해당 상호명에 대한 게시글이 없습니다."),
        ));
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => searchFeed(searchKeyword)),
        );
      }

      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
          color: const Color.fromARGB(255, 242, 242, 242),
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formkey,
                child: Row(
                  children: [
                    Container(
                      width: 270,
                      child: TextFormField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '검색어',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 165, 165)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 165, 165),
                          ),
                        ),
                      ),
                                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 99, 99, 1),
                      ),
                      child: const Text(
                        '검색',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              SizedBox(height: 15),
              Text(
                '카테고리 선택',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Image.asset(
                              'asset/koreanFood.png',
                              height: 55.0,
                              width: 55.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryFeed(boardCategory: '한식'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '한식',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            child: Image.asset(
                              'asset/westernFood.png',
                              height: 55.0,
                              width: 55.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryFeed(boardCategory: '양식'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '양식',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Image.asset(
                              'asset/japaneaseFood.png',
                              height: 55.0,
                              width: 55.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryFeed(boardCategory: '일식'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '일식',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            child: Image.asset(
                              'asset/asianFood.png',
                              height: 55.0,
                              width: 55.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryFeed(boardCategory: '아시안'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '아시안',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Image.asset(
                              'asset/fastFood.png',
                              height: 55.0,
                              width: 55.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryFeed(boardCategory: '패스트푸드'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '패스트푸드',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            child: Image.asset(
                              'asset/three-dots.png',
                              height: 55.0,
                              width: 55.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryFeed(boardCategory: '기타'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '기타',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              child: Image.asset(
                                'asset/chineaseFood.png',
                                height: 55.0,
                                width: 55.0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryFeed(boardCategory: '중식'),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '중식',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 55.0,
                              width: 55.0,
                            ),
                            SizedBox(height: 5),
                            Text(
                              ' ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '인기 게시글',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
                width: double.infinity,
                height: 229,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 13, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('asset/logo.png',
                                          height: 70.0, width: 30.0),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      const Text(
                                        '작성자',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        '제목',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 20,
                                        itemBuilder: (Context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                        direction: Axis.horizontal,
                                        // 여기에 입력된 평점 수 알려주면 될 듯
                                        initialRating: 3,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    child: const DefaultTextStyle(
                                      child: Text(
                                        '내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용',
                                      ),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Image.asset(
                                      'asset/logo.png',
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                  ),
                                  // 자 이제 여러개면 어떻게 되어야할지 생각을 해야겠지?
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 1, 0),
                                  child: Text(
                                    '2024-01-24',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 198, 198, 198),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
}
