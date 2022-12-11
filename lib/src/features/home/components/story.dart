import 'package:flutter/material.dart';
import 'package:kid_starter/src/components/card/header_card.dart';
import 'package:kid_starter/src/components/card/video_card.dart';
import 'package:kid_starter/src/data/videos.dart';
import 'package:kid_starter/src/features/home/components/story_details.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const StoryScreen({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  double offset = 0;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageHeader(
              title: widget.title,
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              offset: offset,
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: storyList.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    VideoCard(
                      tap: () =>Navigator.pushNamed(context, '/storyView'),
                      thumbImage: storyList[index].thumb,
                      name: storyList[index].name,
                      time: storyList[index].time,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
