import 'package:flutter/material.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/data/data.dart';
import 'package:marvel_app/screens/detailed_screens/detailed_screens.dart';
import 'package:marvel_app/widgets/widgets.dart';

class CommonCard extends StatelessWidget {
  final String? type;
  final dynamic data;
  final String? name;
  final String? tag;
  final String? imageUrl;
  final double? height;
  final double? width;

  const CommonCard(
      {this.data,
      this.name,
      this.tag,
      this.imageUrl,
      this.height,
      this.width,
      this.type});

  @override
  Widget build(BuildContext context) {
    final double radius = (width! / 10).roundToDouble();
    final double fontSize = (width! / 12.5).roundToDouble();
    return InkWell(
      onTap: () => _onTap(context),
      child: Hero(
        tag: tag!,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlurFilter(
            radius: radius,
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
                ShowImage(
                  height: height,
                  imageUrl: imageUrl,
                  radius: radius * 3 / 4,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: width,
                    height: height! / 4,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: CustomColors.marvelRed,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    child: Center(
                      child: Text(
                        name!.toUpperCase(),
                        style: TextStyle(
                          color: CustomColors.white,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      switch (type) {
        case TypeConstant.characters:
          return CharacterDetail(
            character: data,
            imageUrl: imageUrl,
            tag: tag,
          );
        case TypeConstant.comics:
          return Container();
        case TypeConstant.creators:
          return Container();
        case TypeConstant.events:
          return Container();
        case TypeConstant.series:
          return Container();
        case TypeConstant.stories:
          return Container();
        default:
          return Container();
      }
    }));
  }
}

class ShowImage extends StatelessWidget {
  final double? height;
  final String? imageUrl;
  final double? radius;

  const ShowImage({Key? key, this.height, required this.imageUrl, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == '' || checkIfImage(imageUrl!)) {
      return NoImageFound();
    } else {
      return Positioned(
        left: 0,
        right: 0,
        height: height! / 1.7,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius!),
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }
}
