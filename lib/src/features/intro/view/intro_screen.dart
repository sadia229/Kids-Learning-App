import 'package:flutter/material.dart';
import 'package:kid_starter/constants/asset_path.dart';
import 'package:kid_starter/src/features/home/view/home_screen.dart';
import 'package:kid_starter/styles/k_colors.dart';
import 'package:kid_starter/styles/k_text_style.dart';
import 'package:kid_starter/utils/extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _controller = PageController();

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              height: context.screenHeight * 0.35,
              child: PageView(
                controller: _controller,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        AssetPath.introOne,
                        height: 210,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Grow math knowledge',
                        style: KTextStyle.subtitle2,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        AssetPath.introTwo,
                        height: 210,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Boost social learning & creativity',
                        style: KTextStyle.subtitle2,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        AssetPath.introThree,
                        height: 215,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Spark a love of reading & writing',
                        style: KTextStyle.subtitle2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.screenHeight * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                onDotClicked: (index) {
                  setState(() {
                    selectIndex = index;
                    _controller.animateToPage(
                      selectIndex,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                effect: const ExpandingDotsEffect(
                  activeDotColor: KColor.orange,
                  dotColor: KColor.redOrange,
                  dotHeight: 10,
                  dotWidth: 12,
                  radius: 107,
                  spacing: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
