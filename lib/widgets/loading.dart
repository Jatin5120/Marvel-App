import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/widgets/widgets.dart';

class Loading extends StatelessWidget {
  final bool? isDark;

  Loading({this.isDark});
  @override
  Widget build(BuildContext context) {
    final double radius = 10.0;
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size.width / 5,
            width: size.width / 5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.lightBlack,
            ),
            child: SpinKitFadingCircle(
              size: 60.0,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index.isEven
                          ? CustomColors.marvelRed
                          : CustomColors.white),
                );
              },
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          BlurFilter(
            radius: radius,
            child: Container(
              width: size.width/1.5,
              decoration: BoxDecoration(
                color: isDark! ? CustomColors.lightWhite : CustomColors.lightBlack,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Fetching data from the Internet ...',
                    style: TextStyle(
                      color: isDark! ? CustomColors.black : CustomColors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
