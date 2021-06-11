import 'package:flutter/material.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/navigator.dart';
import 'package:marvel_app/widgets/widgets.dart';
import 'package:marvel_app/data/data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static HomeScreenState? of(BuildContext context) {
    final HomeScreenState? result =
        context.findAncestorStateOfType<HomeScreenState>();
    return result;
  }

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late CurrentTheme currentTheme;
  late Duration duration;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> buttonAnimation;
  late bool isOpen;

  @override
  void initState() {
    super.initState();
    currentTheme = Provider.of<CurrentTheme>(context, listen: false);
    currentTheme.setPreference();
    // currentTheme.myAnimation.init();
    isOpen = false;
    duration = const Duration(milliseconds: 300);
    controller = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(controller);
    buttonAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(controller);
  }

  void drawerAnimation() {
    if (isOpen)
      controller.reverse();
    else
      controller.forward();
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = (size.width / 7).roundToDouble();
    final double position = (size.width / 30).roundToDouble();
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            currentTheme.isDark ? CustomColors.darkBg : CustomColors.lightBg,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            MyDrawer(),
            AnimatedPositioned(
              top: 0,
              bottom: 0,
              right: isOpen ? -size.width * 0.6 : 0,
              left: isOpen ? size.width * 0.6 : 0,
              duration: duration,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Material(
                  animationDuration: duration,
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Body(
                    type: 'dashboard',
                    title: Container(
                      child: Image.asset('assets/images/marvel_logo.png'),
                    ),
                    isImage: true,
                    scrollingChild: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: padding,
                        ),
                        for (String type in typeConstants) _buildTypeCard(type),
                        SizedBox(
                          height: padding / 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: position,
              left: position,
              child: IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  color: currentTheme.isDark
                      ? CustomColors.white
                      : isOpen
                          ? CustomColors.marvelRed
                          : CustomColors.white,
                  progress: buttonAnimation,
                ),
                onPressed: () => drawerAnimation(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeCard(String type) {
    return TypeCard(
      type: type,
      onTap: () =>
          Navigator.pushNamed(context, MyRoutes.dashboard, arguments: type),
    );
  }
}
