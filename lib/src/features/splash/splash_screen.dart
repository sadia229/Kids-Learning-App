import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kid_starter/src/constants/asset_path.dart';
import 'package:kid_starter/src/features/home/view/home_screen.dart';
import 'package:kid_starter/src/service/navigation_service.dart';
import 'package:kid_starter/src/styles/k_colors.dart';
import 'package:kid_starter/src/styles/k_text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  final _audioPlayer = AudioPlayer();
  double _opacity = 0;
  bool _value = true;

  void _introAudio() async {
    try {
      await _audioPlayer
          .setAsset('assets/audio/intro/mystical-wind-chimes.mp3');
      _audioPlayer.setVolume(2.0);
      _audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading intro audio: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _introAudio();
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            HapticFeedback.lightImpact();
            Navigator.of(context).pushReplacement(
              ThisIsFadeRoute(
                route: const HomeScreen(),
              ),
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        _value = false;
      });
    });
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.orange,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(
                  'WELCOME\nTO\nKID  STARTER',
                  textAlign: TextAlign.center,
                  style: KTextStyle.splashStyle,
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 6),
              opacity: _opacity,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 2),
                height: _value ? 50 : 200,
                width: _value ? 50 : 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: KColor.shadow.withOpacity(0.2),
                      blurRadius: 100,
                      spreadRadius: 10,
                    ),
                  ],
                  color: KColor.redOrange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: Stack(
                      children: [
                        Image.asset(AssetPath.logo),
                        AnimatedBuilder(
                          animation: scaleAnimation,
                          builder: (c, child) => Transform.scale(
                            scale: scaleAnimation.value,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: KColor.redOrange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
