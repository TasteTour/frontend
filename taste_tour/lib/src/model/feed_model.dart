class FeedModel {
  int? id;
  String? title;
  String? location;
  String? content;
  String? category;
  DateTime? createdAt;
  int? userId;
  int? imageId;
  FeedModel.parse(Map m) {
    id = m['id'];
    title = m['title'];
    content = m['content'];
    location = m['location'];
    category = m[;category];
    createdAt = DateTime.parse(m['created_at']);
    userId = m['user_id'];
    imageId = m['image_id'];
  }
}
