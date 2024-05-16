import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/page.preformat.dart';

class Slides extends StatefulWidget {
  final logoOnSlide;
  final String? imageOnSlide;
  final String slideTitle;
  final String slideParagraph;
  final Color activeColor;
  final List slideContentsList;

  Slides(
      {required this.logoOnSlide,
      required this.imageOnSlide,
      required this.slideTitle,
      required this.slideParagraph,
      required this.activeColor,
      required this.slideContentsList});

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PreformatPage.useScreenWidth(25)),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              widget.logoOnSlide != null
                  ? Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: 115,
                          height: 115,
                          child: Image.asset(widget.logoOnSlide,
                              fit: BoxFit.contain)),
                    )
                  : Container(
                      child: Image.asset(widget.imageOnSlide!),
                    ),

              Gap(PreformatPage.useScreenHeight(45)),

              // title
              Container(
                width: PreformatPage.screenWidth(),
                child: Text(
                  widget.slideTitle,
                  style: GoogleFonts.dmSans(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              Gap(PreformatPage.useScreenHeight(30)),

              // text
              Text(
                widget.slideParagraph,
                style: GoogleFonts.mulish(fontSize: 17),
              )
            ],
          ),
        ],
      ),
    );
  }
}
