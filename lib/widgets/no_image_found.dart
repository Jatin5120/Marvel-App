import 'package:flutter/material.dart';
import 'package:marvel_app/constants/colors.dart';

class NoImageFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double topPadding = (MediaQuery.of(context).size.width / (1.5 * 9)).roundToDouble();
    final double verticalPadding = topPadding * 2/3;
    final double fontSize = topPadding * 28/30;
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: EdgeInsets.fromLTRB(verticalPadding, topPadding, verticalPadding, 0.0),
      child: Text(
        'IMAGE NOT FOUND',
        style: TextStyle(
          color: CustomColors.marvelRed,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.8,
        ),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );
  }
}
