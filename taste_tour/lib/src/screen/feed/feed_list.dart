import 'package:flutter/material.dart';
import 'package:taste_tour/src/controller/feed_controller.dart';
import 'package:taste_tour/src/model/feed_model.dart';
import 'package:taste_tour/src/widget/feed_list_item.dart';
import 'package:taste_tour/src/model/feed_model.dart';
import 'package:get/get.dart';

final feedController = Get.put(FeedController());

class FeedList extends StatefulWidget {
  const FeedList({super.key});

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  void initState() {
    super.initState();
    feedController.FeedList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(builder: (controller) {
      return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: controller.list.length,
        itemBuilder: (context, index) {
          return FeedListItem(controller.list[index]);
        },
      );
    });
  }
}
