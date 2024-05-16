import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/buttons.dart';
import '../util/page.preformat.dart';
import '../util/color.scheme.dart';
import '../util/color.scheme.dart';
import '../util/fonts.dart';

class EarnScreen extends StatelessWidget {
  const EarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // column 1
          Column(
            children: [
              Gap(PreformatPage.useScreenHeight(50)),
              // image
              Container(
                height: PreformatPage.useScreenHeight(70),
                width: PreformatPage.useScreenHeight(80),
              ),
              Gap(PreformatPage.useScreenHeight(30)),
              Gap(PreformatPage.useScreenHeight(20)),
              // Title
              Text(
                'Invite friends and Earn',
                style: AppFonts.heading2,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                child: RichText(

                  textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Invite your friends in the US and earn ',
                        style: GoogleFonts.mulish(color: Colors.black, fontSize: 14, height: 1.5),
                        children: [
                      TextSpan(text: 'N4,000.00 ', style: GoogleFonts.mulish(fontWeight: FontWeight.w600, fontSize: 16)),
                      TextSpan(
                          text:
                              'when they send at least \$30 to an African country 🇳🇬 🇺🇬 🇺🇦')
                    ])),
              )
            ],
          ),
          // column 2
          // buttons
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(children: [
              PurpleButton(
                  buttonFunction: () {}, buttonTitle: 'Invite a Friend'),
              Gap(PreformatPage.useScreenHeight(10)),
              TransparentButton(
                  buttonFunction: () {}, buttonTitle: 'Enter Referral code'),
              Gap(PreformatPage.useScreenHeight(10)),
              TransparentButton(
                  buttonFunction: () {}, buttonTitle: 'Enter Referral code'),
              Gap(PreformatPage.useScreenHeight(10)),
              TextButton(
                  onPressed: () {},
                  child: Text('View Terms and Conditions',
                      style: GoogleFonts.mulish(
                          color: AppColorScheme.activeInputColor, fontWeight: FontWeight.w700,))),
              // Gap(PreformatPage.useScreenHeight(20)),
            ]),
          )
        ],
      ),
    );
  }
}
