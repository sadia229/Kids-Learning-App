import 'package:flutter/material.dart';
import 'package:kid_starter/src/features/home/components/story_details.dart';
import 'package:kid_starter/src/styles/k_colors.dart';
import 'package:kid_starter/src/styles/k_text_style.dart';
import 'package:video_player/video_player.dart';

class StoryViewScreen extends StatelessWidget {
  const StoryViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColor.orange,
        title: Text('Stories',style: KTextStyle.subtitle3,),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          StoryDetails(
            videoPlayerController:
                VideoPlayerController.asset(
                  'assets/videos/episode-3.mp4'
                ),
            lopping: true,
          ),
        ],
      ),
    );
  }
}
