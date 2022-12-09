import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kid_starter/src/features/home/components/custom_clip.dart';
import 'package:kid_starter/src/service/audio_service.dart';
import 'package:kid_starter/src/styles/k_text_style.dart';

class PageHeader extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final double offset;

  const PageHeader({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
    required this.offset,
  }) : super(key: key);

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> {
  final _audioPlayer = AudioPlayer();
  AudioService audioService = AudioService();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [widget.primaryColor, widget.secondaryColor],
          ),
          image: const DecorationImage(
            image: AssetImage("assets/images/bg-stars.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  audioService.popAudio();
                  Navigator.pop(context);
                },
                child: Text(
                  '<<',
                  style: KTextStyle.backButtonStyle,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 30 - widget.offset / 4,
                    child: Text(
                      widget.title,
                      style: KTextStyle.kHeadingTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
