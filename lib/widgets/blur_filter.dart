import 'dart:ui';

import 'package:flutter/material.dart';

class BlurFilter extends StatelessWidget {
  final Widget? child;
  final double? radius;
  final double? blur;

  BlurFilter({this.child, this.radius, this.blur});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius??0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur??5,
          sigmaY: blur??5,
        ),
        child: child,
      ),
    );
  }
}
