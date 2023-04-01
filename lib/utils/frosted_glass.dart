import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  const FrostedGlass(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);
  final double width;
  final double height;
  final dynamic child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent.withOpacity(0.2),
        child: Stack(
          children: [
            //blur effect ~bottom layer
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(),
            ),
            //gradient effect ~middle layer
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border.all(color: Colors.white.withOpacity(0.13)),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            //child ~ top layer
            Center(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}