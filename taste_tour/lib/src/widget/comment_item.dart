import 'package:flutter/material.dart';
import 'package:taste_tour/src/model/comment_model.dart';

class commentItem extends StatelessWidget {
  final CommentModel item;
  commentItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(child: Image.asset('asset/profile.jpg', height: 45.0, width: 45.0, fit: BoxFit.cover)),
                SizedBox(width:10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${item.memberName}",style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w800)),
                    Text("${item.commentContent}",style: TextStyle(
                        fontSize: 16))
                  ],
                ),
              ],
            ),
            Text(
              '${item.commentCreated}',
              style: TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 198, 198, 198),
              ),)
          ],
        ),SizedBox(height: 5,)
      ],
    );
  }
}
