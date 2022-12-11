import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kid_starter/src/components/card/header_card.dart';
import 'package:kid_starter/src/components/card/tile_card.dart';
import 'package:kid_starter/src/data/numeric_en_list.dart';
import 'package:kid_starter/src/service/audio_service.dart';
import 'package:kid_starter/src/styles/k_colors.dart';

class NumberScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const NumberScreen({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
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
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              offset: offset,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: numericEnList.length,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: TileCard(
                    title: numericEnList[index].text,
                    textColor: KColor.getIndexColor(index),
                    onTap: () =>
                        audioService.playAudio(numericEnList[index].audio),
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
