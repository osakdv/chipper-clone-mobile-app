import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

import '../util/page.preformat.dart';

class HomeNotification1 extends StatelessWidget {
  const HomeNotification1({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          height: PreformatPage.useScreenHeight(166),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: PreformatPage.useScreenWidth(20),
              vertical: PreformatPage.useScreenWidth(12)),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: Color.fromARGB(255, 242, 242, 242), width: 1))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    // avatar
                    Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(62, 0, 0, 0))
                            ],
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 230, 125, 35)),
                        child: Text('U',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18))),
                    Gap(PreformatPage.useScreenHeight(15)),
                    Container(
                      width: MediaQuery.of(context).size.width * .45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('You paid Emmanuel Omwanghe',
                              style: GoogleFonts.mulish(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                          Gap(PreformatPage.useScreenHeight(3)),
                          // date
                          Text('Friday at 5:09 PM',
                              style: GoogleFonts.mulish(fontSize: 12))
                        ],
                      ),
                    )
                  ]),

                  // amount
                  Container(
                      width: MediaQuery.of(context).size.width * .28,
                      child: Text('-N20,000.00',
                          style: GoogleFonts.mulish(fontSize: 16))),
                ],
              ),
              Gap(PreformatPage.useScreenHeight(30)),
              // message
              Text('Payment to Emmanuel Omwanghe : 7132 is complete',
                  style: GoogleFonts.mulish(
                      fontSize: 15, color: Color.fromARGB(255, 27, 27, 27)))
            ],
          ),
        ),
      );
    });
  }
}
