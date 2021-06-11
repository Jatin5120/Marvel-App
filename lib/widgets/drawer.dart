import 'package:flutter/material.dart';
import 'package:marvel_app/navigator.dart';
import 'package:marvel_app/screens/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/data/data.dart';
import 'package:marvel_app/widgets/widgets.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late CurrentTheme currentTheme;
  Color? bgColor;

  @override
  void initState() {
    super.initState();
    currentTheme = Provider.of<CurrentTheme>(context, listen: false);
    bgColor =
        (currentTheme.isDark ? CustomColors.frostDark : CustomColors.frostWhite)
            .withOpacity(0.5);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = (size.height / 18).roundToDouble();
    final double fontSize = (size.width / (19)).roundToDouble();
    return Stack(
      children: [
        MarvelName(),
        BlurFilter(
          radius: 0,
          child: Container(
            height: size.height,
            width: size.width,
            color: bgColor,
          ),
        ),
        Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: padding / 2, vertical: padding),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: size.width / 9,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Jatin',
                            style: TextStyle(
                              color: currentTheme.isDark
                                  ? CustomColors.white
                                  : CustomColors.marvelRed,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (String type in typeConstants)
                    ListItem(type: type, isDark: currentTheme.isDark),
                ],
              ),
            ),
            DrawerRedBar(
              iconData: Icons.settings_rounded,
              onPressed: () {
                HomeScreen.of(context)!.drawerAnimation();
                Navigator.pushNamed(context, MyRoutes.settings);
              },
              tooltip: 'Settings',
            ),
          ],
        ),
      ],
    );
  }
}

class DrawerRedBar extends StatelessWidget {
  const DrawerRedBar({
    Key? key,
    required this.iconData,
    required this.onPressed,
    this.tooltip,
  }) : super(key: key);

  final IconData? iconData;
  final VoidCallback? onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.marvelRed,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          IconButton(
            tooltip: tooltip ?? '',
            icon: Icon(
              iconData!,
              color: CustomColors.white,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.type, this.isDark}) : super(key: key);

  final String? type;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double horizontalPadding = (size.width / 20).roundToDouble();
    final double verticalPadding = (size.height / 40).roundToDouble();
    final double fontSize = (size.width / 22).roundToDouble();
    final Color color = isDark! ? CustomColors.white : CustomColors.marvelRed;
    return ListTile(
      onTap: () {
        HomeScreen.of(context)!.drawerAnimation();
        Navigator.pushNamed(context, MyRoutes.dashboard, arguments: type!);
      },
      contentPadding:
          EdgeInsets.only(left: horizontalPadding, bottom: verticalPadding),
      leading: Icon(
        myIcons[type],
        color: color,
      ),
      title: Text(
        type!.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
      // trailing: Icon(
      //   Icons.arrow_forward_ios_rounded,
      //   color: color,
      //   size: fontSize * 1.3,
      // ),
    );
  }
}

/*
const Text(
  'Thank you so much for coming here, ab jao yha se mai kya karu',
  style: TextStyle(
    color: CustomColors.white,
    fontSize: 12.0,
  ),
  textAlign: TextAlign.center,
  softWrap: true,
),
*/
