import 'package:flutter/material.dart';

class OnBoardingEnterAnimation {
  OnBoardingEnterAnimation(this.controller)
      : scaleTranslation = new Tween(begin: 0.0, end: 1.0).animate(
    new CurvedAnimation(
      parent: controller,
      curve: new Interval(
        0.0,
        0.5,
        curve: Curves.fastOutSlowIn,
      ),
    ),
  ),fadeTranslation = new Tween(begin: 0.0, end: 1.0).animate(
    new CurvedAnimation(
      parent: controller,
      curve: new Interval(
        0.5,
        1,
        curve: Curves.fastOutSlowIn,
      ),
    ),
  );

  final AnimationController controller;
  final Animation<double> scaleTranslation;
  final Animation<double> fadeTranslation;
}
