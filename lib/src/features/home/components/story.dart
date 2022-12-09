import 'package:flutter/material.dart';
import 'package:kid_starter/src/components/card/header_card.dart';
import 'package:kid_starter/src/styles/k_text_style.dart';

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
  final _scrollController = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (_scrollController.hasClients) ? _scrollController.offset : 0;
    });
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
              crossAxisCount: 1,
              crossAxisSpacing: 20.0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Coming soon...',
                      style: KTextStyle.subtitle1,
                    ),
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
