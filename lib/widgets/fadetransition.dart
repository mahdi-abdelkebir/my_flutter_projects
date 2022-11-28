import 'package:flutter/material.dart';

class MyFadeTransition extends PageRouteBuilder {
  final Widget widget;
  final double fade;

  MyFadeTransition({required this.widget, this.fade = 1})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(opacity: animation, child: child);
        });
}
