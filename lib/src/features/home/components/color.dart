import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kid_starter/src/components/card/header_card.dart';
import 'package:kid_starter/src/components/card/tile_card.dart';
import 'package:kid_starter/src/data/color_controller.dart';
import 'package:kid_starter/src/service/audio_service.dart';
import 'package:kid_starter/src/styles/b_style.dart';

class ColorScreen extends StatefulWidget {
  final String title;
  final Color primaryColorScreen;
  final Color secondaryColorScreen;

  const ColorScreen({
    Key? key,
    required this.title,
    required this.primaryColorScreen,
    required this.secondaryColorScreen,
  }) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  final _scrollController = ScrollController();
  final _audioPlayer = AudioPlayer();
  AudioService audioService = AudioService();
  double offset = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: PageHeader(
              title: widget.title,
              primaryColor: widget.primaryColorScreen,
              secondaryColor: widget.secondaryColorScreen,
              offset: offset,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: colorList.length,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: TileCard(
                    title: colorList[index].name,
                    textColor: colorList[index].name == 'White'
                        ? KColor.kTitleTextColor
                        : KColor.white,
                    backgroundColor: Color(int.parse(colorList[index].code)),
                    fontSizeBase: 30,
                    fontSizeActive: 40,
                    onTap: () => audioService.playAudio(colorList[index].audio),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
