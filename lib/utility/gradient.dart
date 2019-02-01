import 'package:flutter/material.dart';

class AppGradient {

  const AppGradient();

  static const linearBlueGradient = const BoxDecoration(
    gradient: const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: <Color>[
        const Color(0xFF00BCD4),
        const Color(0xFF00838F),
      ],
    ),
  );

  static const linearBlackGradient = const BoxDecoration(
    gradient: const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: <Color>[
        Colors.transparent,
        Colors.black38,
      ],
    ),
  );


  static List<Color> getColors() {
    DateTime now = DateTime.now();
    int timeAsMins = now.hour * 60 + now.minute;
    var lerpValue = (timeAsMins <= 720) ? timeAsMins / 720 : (2 - timeAsMins / 720);
    var topSkyColor = Color.lerp(
        Colors.indigo.shade700, Colors.lightBlueAccent.shade700, lerpValue);
    var bottomSkyColor = Color.lerp(
        Colors.indigo.shade100, Colors.lightBlueAccent.shade100, lerpValue)
        .withOpacity(0.8);
    return [topSkyColor, bottomSkyColor];
  }
}