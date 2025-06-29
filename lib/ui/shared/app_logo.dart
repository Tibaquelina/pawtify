import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/logo.png",height: 97,),
        SizedBox(width: 6),
        Text("Pawtify",
          style: GoogleFonts.junge(
            fontSize: 40,
          )
        )
      ],
    );
  }
}