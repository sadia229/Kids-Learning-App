import 'package:flutter/material.dart';

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget route;

  ThisIsFadeRoute({required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
