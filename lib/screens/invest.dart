import 'package:chipper_clone/widgets/stock.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/page.preformat.dart';
import '../widgets/buttons.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PreformatPage.screenWidth(),
      height: PreformatPage.screenHeight() -
          (MediaQuery.of(context).viewPadding.top +
              MediaQuery.of(context).viewPadding.bottom),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(children: [
          Container(
            height: constraints.maxHeight * .89,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // spacing
                  Gap(PreformatPage.useScreenHeight(15)),
                  // text column
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: PreformatPage.sideSpacing),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Build your portfolio',
                              style: GoogleFonts.dmSans(
                                  fontSize: 30, fontWeight: FontWeight.w800)),
                          Gap(PreformatPage.useScreenHeight(5)),
                          Text(
                              'Buy your first stock with as little as \$1 approx N759.78',
                              style:
                                  GoogleFonts.mulish(fontSize: 17, height: 1.5))
                        ]),
                  ),
                  Gap(PreformatPage.useScreenHeight(20)),
                  // image
                  Container(
                    height: PreformatPage.useScreenHeight(300),
                    width: PreformatPage.screenWidth() * .88,
                    child: Image.asset(
                      'assets/imgs/investment.png',
                      fit: BoxFit.contain,
                      semanticLabel: 'Investment',
                    ),
                  ),
                  //Text Column
                  Gap(PreformatPage.useScreenHeight(25)),
                  // text column
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: PreformatPage.sideSpacing),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Most Popular',
                              style: GoogleFonts.dmSans(
                                  fontSize: 30, fontWeight: FontWeight.w800)),
                          Gap(PreformatPage.useScreenHeight(5)),
                          Text(
                              'The most commonly traded stocks in the Chipper community,',
                              style:
                                  GoogleFonts.mulish(fontSize: 17, height: 1.5))
                        ]),
                  ),

                  Gap(PreformatPage.useScreenHeight(30)),

                  // stock widget
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: PreformatPage.sideSpacing),
                    child: Column(children: [Stock()]),
                  )
                ],
              ),
            ),
          ),

          // search stock button
          SizedBox(
              child: Padding(
            padding: EdgeInsets.only(
                top: PreformatPage.useScreenHeight(12),
                left: PreformatPage.sideSpacing,
                right: PreformatPage.sideSpacing),
            child: PurpleButton(
                buttonFunction: () {}, buttonTitle: 'Search Stock'),
          ))
        ]);
      }),
    );
  }
}
