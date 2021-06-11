import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:marvel_app/constants/colors.dart';
import 'package:marvel_app/widgets/blur_filter.dart';

class TypeCard extends StatefulWidget {
  final String? type;
  final void Function()? onTap;

  const TypeCard({Key? key, this.type, this.onTap}) : super(key: key);
  @override
  _TypeCardState createState() => _TypeCardState();
}

class _TypeCardState extends State<TypeCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.width / 1.3;
    final double width = size.width / 1.2;
    const double radius = 20.0;
    final double padding = size.width / (1.6 * 8);
    return Hero(
      tag: widget.type!,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: BlurFilter(
          radius: radius,
          child: InkWell(
            onTap: widget.onTap,
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: CustomColors.frostWhite,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: padding),
                    decoration: BoxDecoration(
                      color: CustomColors.marvelRed,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    width: width,
                    height: height / 3,
                    child: Image.asset('assets/images/marvel_logo.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    width: width,
                    height: height * 2 / 3,
                    child: Center(
                      child: Text(
                        widget.type!.toUpperCase(),
                        style: TextStyle(
                          color: CustomColors.marvelRed,
                          fontSize: padding * 1.6,
                          letterSpacing: -0.7,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
