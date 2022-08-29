import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kid_starter/route/route_generator.dart';
import 'package:kid_starter/styles/k_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kid Starter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: KColor.kBackgroundColor,
        fontFamily: "CabinSketch",
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: KColor.kBodyTextColor),
        ),
      ),
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
