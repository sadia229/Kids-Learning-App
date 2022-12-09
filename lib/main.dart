import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kid_starter/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}
