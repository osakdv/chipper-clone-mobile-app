import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/page.preformat.dart';

class PurpleButton extends StatelessWidget {
  final Function buttonFunction;
  final String buttonTitle;
  PurpleButton({required this.buttonFunction, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonFunction();
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: PreformatPage.useScreenHeight(52),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 115, 58, 229),
            borderRadius:
                BorderRadius.circular(PreformatPage.useScreenHeight(14))),
        child: Text(
          buttonTitle,
          style: GoogleFonts.mulish(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  final Function buttonFunction;
  final String buttonTitle;
  TransparentButton({required this.buttonFunction, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonFunction();
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: PreformatPage.useScreenHeight(52),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Color.fromARGB(255, 233, 233, 233)),
            borderRadius:
                BorderRadius.circular(PreformatPage.useScreenHeight(14))),
        child: Text(
          buttonTitle,
          style: GoogleFonts.mulish(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
