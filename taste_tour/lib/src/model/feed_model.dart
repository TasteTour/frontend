import 'package:flutter/rendering.dart';

class FeedModel {
  String? boardTitle;
  String? boardStoreLocation;
  String? boardContent;
  String? boardCategory;
  DateTime? boardCreated;
  int? boardStar;
  int? imageId;
  FeedModel.parse(Map m) {
    boardTitle = m['boardTitle'];
    boardContent = m['boardContent'];
    boardStoreLocation = m['boardStoreLocation'];
    boardCategory = m['boardCategory'];
    boardStar = m['boardStar'];
    boardCreated = DateTime.parse(m['boardCreated']);
    imageId = m['image_id'];
  }
}
