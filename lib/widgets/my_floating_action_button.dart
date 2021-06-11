import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/data/data.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class MyFloatingActionButton extends StatefulWidget {
  MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late CurrentTheme currentTheme;
  late AnimationController fabAnimation;
  late Artboard? _riveArtBoard = null;
  late RiveAnimationController _controller;
  late String _animationTitle;
  // late MyAnimation _myAnimation;

  // void initializeAnimation() async {
  //   print("initAnimation");
  //   final bool temp = await _myAnimation.initialized();
  //   _controller = _myAnimation.getController;
  //   _riveArtBoard = _myAnimation.getArtboard;
  // }

  @override
  void initState() {
    super.initState();
    currentTheme = Provider.of<CurrentTheme>(context, listen: false);
    // _myAnimation = currentTheme.myAnimation;
    fabAnimation =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    if (!currentTheme.isDark) {
      print("Played forward");
      fabAnimation.forward();
    }
    // initializeAnimation();

    _animationTitle = currentTheme.isDark ? 'bright' : 'dark';
    rootBundle.load('assets/animation/theme_animation.riv').then(
      (data) async {
        final RiveFile file = RiveFile.import(data);

        final Artboard artBoard = file.mainArtboard;
        artBoard.addController(_controller = SimpleAnimation(_animationTitle));
        setState(() => _riveArtBoard = artBoard);
      },
    );
  }

  void onFABClick() {
    if (!fabAnimation.isAnimating) {
      currentTheme.changeTheme();
      _animationTitle = currentTheme.isDark ? 'to_bright' : 'to_dark';
      currentTheme.isDark ? fabAnimation.reverse() : fabAnimation.forward();
      currentTheme.isDark ? print("Reverse") : print("Forward");
      _riveArtBoard!.removeController(_controller);
      _riveArtBoard!
          .addController(_controller = SimpleAnimation(_animationTitle));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: currentTheme.isDark ? 'BRIGHT' : 'DARK',
      onPressed: onFABClick,
      backgroundColor: CustomColors.marvelRed,
      child: RotationTransition(
        turns: fabAnimation,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _riveArtBoard == null
              ? const SizedBox()
              : Rive(artboard: _riveArtBoard!),
        ),
      ),
    );
  }
}
