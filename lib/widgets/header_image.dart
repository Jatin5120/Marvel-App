import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/widgets/widgets.dart';

class HeaderImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final BoxFit? backFit, foreFit;

  const HeaderImage({Key? key, this.imageUrl, this.width, this.backFit, this.foreFit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          imageUrl!,
          width: width,
          fit: backFit
        ),
        BlurFilter(
          child: Container(
            width: width,
            height: width,
            color: CustomColors.transparent,
          ),
        ),
        Image.network(
          imageUrl!,
          fit: foreFit,
        ),
      ],
    );
  }
}
