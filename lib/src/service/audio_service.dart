import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  final _audioPlayer = AudioPlayer();

  pushAudio() async {
    try {
      await _audioPlayer.setAsset(
        'assets/audio/screen_transition/push-page-forward-single-chime.wav',
      );
      _audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading Navigator.push audio: $e");
    }
  }

  playAudio(String assetPath) async {
    try {
      await _audioPlayer.setAsset(assetPath);
      _audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio source: $e");
    }
  }

  popAudio() async {
    try {
      await _audioPlayer.setAsset(
        'assets/audio/screen_transition/pop-page-back-chime.wav',
      );
      _audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading Navigator.pop audio: $e");
    }
  }

  navigate(BuildContext context, Widget screen) {
    pushAudio();
    HapticFeedback.lightImpact();
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    );
  }
}
