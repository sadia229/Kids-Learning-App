import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kid_starter/src/service/audio_service.dart';
import 'package:kid_starter/src/styles/k_text_style.dart';

class CategoryCard extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final Widget screen;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
    required this.screen,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final _audioPlayer = AudioPlayer();
  AudioService audioService = AudioService();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            color: Colors.grey[900]!.withOpacity(0.2),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [widget.primaryColor, widget.secondaryColor],
        ),
      ),
      height: 180.0,
      child: InkWell(
        onTap: () => audioService.navigate(context, widget.screen),
        child: Center(
          child: Text(
            widget.title,
            style: KTextStyle.kHeadingTextStyle.copyWith(
              fontSize: 90.0,
              letterSpacing: 4.0,
            ),
            softWrap: false,
          ),
        ),
      ),
    );
  }
}
