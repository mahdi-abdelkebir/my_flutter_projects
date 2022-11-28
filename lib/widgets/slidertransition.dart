import 'package:flutter/material.dart';

class MySlideTransition extends PageRouteBuilder {
  final Widget widget;
  final AxisDirection direction;

  MySlideTransition({required this.widget, this.direction = AxisDirection.up})
      : super(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: slideDirection(direction),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });

  static slideDirection(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}
