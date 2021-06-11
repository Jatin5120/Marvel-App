import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_app/data/data.dart';
import 'package:marvel_app/navigator.dart';
import 'package:provider/provider.dart';

void statusBarSettings() {
  print("SystemChrome");
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    statusBarSettings();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentTheme(),
      child: Consumer<CurrentTheme>(builder:
          (BuildContext context, CurrentTheme currentTheme, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: currentTheme.currentThemeData,
          initialRoute: MyRoutes.home,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      }),
    );
  }
}
