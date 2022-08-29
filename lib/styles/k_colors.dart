import 'dart:math';

import 'package:flutter/material.dart';

class KColor {
  static const Color primary = Color(0xFF000000);
  static const Color white = Color(0xFFffffff);
  static const Color orange = Color(0xFDFF7E00);
  static const Color redOrange = Color(0xFDF8B35B);
  static const Color shadow = Color(0xFFBAFCF4);
  static const kBackgroundColor = Color(0xFFFEFEFE);
  static const kTitleTextColor = Color(0xFF303030);
  static const kBodyTextColor = Color(0xFF4B4B4B);
  static const kTextLightColor = Color(0xFF959595);
  static const kInfectedColor = Color(0xFFFF8748);
  static const kDeathColor = Color(0xFFFF4848);
  static const kRecoverColor = Color(0xFF36C12C);
  static const kPrimaryColor = Color(0xFF3382CC);
  static final kShadowColor = const Color(0xFFB7B7B7).withOpacity(.16);
  static final kActiveShadowColor = const Color(0xFF4056C6).withOpacity(.15);

  static Color getRandomColor({double opacity = 0.8}) {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)]
        .withOpacity(opacity);
  }

  static Color getIndexColor(int index, {double opacity = 0.8}) {
    return Colors.primaries[index % Colors.primaries.length]
        .withOpacity(opacity);
  }
}
