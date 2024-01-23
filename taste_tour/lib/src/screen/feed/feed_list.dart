import 'package:flutter/material.dart';
import 'package:taste_tour/src/widget/feed_list.dart';

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 50,
      itemBuilder: (context, index) {
        return FeedListItem();
      },
    );
  }
}
