import 'package:flutter/material.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/data/data.dart';
import 'package:marvel_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final String? type;
  final Widget? scrollingChild;
  final Widget? title;
  final bool? isImage;
  final bool? showAppBar;

  Body(
      {required this.type,
      required this.scrollingChild,
      required this.title,
      this.isImage,
      this.showAppBar = true});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late CurrentTheme currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = Provider.of<CurrentTheme>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double margin = (size.width / 40).roundToDouble();
    return Scaffold(
      backgroundColor: currentTheme.isDark? CustomColors.darkBg : CustomColors.lightBg,
      floatingActionButton: MyFloatingActionButton(),
      body: Stack(
        children: [
          if (widget.type != null)
            Opacity(
              opacity: 0.5,
              child: Image.asset(
                  'assets/images/${widget.type}.png',
                  fit: BoxFit.cover,
                ),
            ),
          MarvelName(),
          widget.scrollingChild!,
          if (widget.showAppBar!)
            Positioned(
              top: margin,
              left: margin,
              right: margin,
              child: MyAppBar(
                size: size,
                title: widget.title,
                isImage: widget.isImage,
              ),
            ),
        ],
      ),
    );
  }
}
