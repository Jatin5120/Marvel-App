// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:marvel_app/data/data.dart';
// import 'package:rive/rive.dart';

// class MyAnimation {
//   late Artboard _riveArtBoard;
//   late RiveAnimationController _controller;
//   late String _animationTitle;
//   late bool? isDark;
//   bool isInitialized = false;

//   MyAnimation._();

//   static final _instance = MyAnimation._();

//   factory MyAnimation(bool isDark) {
//     _instance.isDark = isDark;
//     return _instance;
//   }

//   static MyAnimation get instance => _instance;

//   RiveAnimationController get getController => _controller;

//   Artboard get getArtboard => _riveArtBoard;

//   Future<bool> initialized() async {
//     while (!isInitialized) {
//       print('In Animation class -> $isInitialized');
//     }
//     print("Done Initialization");
//     return isInitialized;
//   }

//   void init() {
//     print('Init -> $isInitialized');
//     _animationTitle = isDark! ? 'bright' : 'dark';
//     rootBundle.load('assets/animation/theme_animation.riv').then(
//       (data) {
//         final RiveFile file = RiveFile.import(data);

//         final Artboard artBoard = file.mainArtboard;
//         artBoard.addController(_controller = SimpleAnimation(_animationTitle));
//         _riveArtBoard = artBoard;
//       },
//     );
//     isInitialized = true;
//     print('Init 2 -> $isInitialized');
//   }
// }
