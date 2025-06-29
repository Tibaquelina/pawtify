
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    required this.child,
    super.key
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      decoration: backgroundDecoration(
        Color (0xffFFD0B1),
        Alignment.topLeft
      ),
      child: Container(
        decoration: backgroundDecoration(
          Color (0xffFFBFD2),
          Alignment.topRight
        ),
        child: child,
      ),
    );
  }

  BoxDecoration backgroundDecoration(Color mainColor, Alignment alignment) {
    return BoxDecoration(
      gradient: RadialGradient(
        center: alignment,
        radius: 1.5,
        colors: <Color>[
          mainColor,
          Color(0xffFFFFFF).withAlpha(0)
        ]
      )
    );
  }
}