import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: LottieBuilder.asset(
            width: 275,
            "assets/anims/under-construction_anim.json",
          ),
        ),
        const Text(
          "Sorry, this is under construction",
          style: TextStyle(fontSize: 16, fontFamily: GlobalFonts.fontFamilyJakarta, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
