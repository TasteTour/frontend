import 'package:flutter/material.dart';
import 'package:taste_tour/src/widget/feed_list_item.dart';

class FeedList extends StatefulWidget {
  const FeedList({super.key});

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
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
