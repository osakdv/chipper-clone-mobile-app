import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

import '../util/page.preformat.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: PreformatPage.useScreenHeight(160),
      width: PreformatPage.useScreenWidth(330),
      padding: EdgeInsets.all(PreformatPage.useScreenHeight(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(PreformatPage.useScreenHeight(7)),
        color: Color.fromARGB(255, 16, 2, 99),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image
                  Container(
                    width: constraints.maxWidth * .28,
                    height: constraints.maxHeight * .6,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 216, 213, 169),
                      borderRadius: BorderRadius.circular(
                          PreformatPage.useScreenHeight(7)),
                    ),
                  ),
                  Gap(PreformatPage.useScreenHeight(15)),
                  SizedBox(
                    width: constraints.maxWidth * .65,
                    // height: constraints.maxHeight * .59,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Receive Money From the US 💸',
                            style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                        Gap(PreformatPage.useScreenHeight(4)),
                        Text(
                            'Receive money from friends & family in the US. it\'s instant',
                            style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: 12,
                            ))
                      ],
                    ),
                  )
                ],
              ),

              Gap(PreformatPage.useScreenHeight(15)),
              // button
              GestureDetector(
                onTap: () {},
                child: Text('GET STARTED>',
                    style: GoogleFonts.mulish(
                      color: Color.fromARGB(255, 129, 250, 230),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    )),
              ),
            ]);
      }),
    );
  }
}
