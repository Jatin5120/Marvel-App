import 'package:flutter/material.dart';

class MarvelName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Opacity(
          opacity: 0.75,
          child: Transform.scale(
            scale: 1.5,
            child: Transform.rotate(
              angle: -3.14 / 2,
              child: Image.asset('assets/images/marvel_name.png'),
            ),
          ),
        ),
      ),
    );
  }
}
