import 'dart:math';

import 'package:chipper_clone/widgets/home.card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/fonts.dart';
import '../util/page.preformat.dart';
import '../util/color.scheme.dart';
import './pay.cash.dart';
import '../widgets/home.notification.dart';
import '../widgets/buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _navToService(screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => screen));
  }

  final List _quickService = [
    {
      'service': 'Add Cash',
      'icon': const Icon(Icons.attach_money_outlined, color: Colors.white),
      'bgColor': Color.fromARGB(255, 54, 122, 248),
      'page': PayCashScreen()
    },
    {
      'service': 'Buy Airtime',
      'icon': const Icon(Icons.attach_money_outlined, color: Colors.white),
      'bgColor': Color.fromARGB(255, 14, 171, 54),
      'page': PayCashScreen()
    },
    {
      'service': 'Data Bundle',
      'icon': const Icon(Icons.attach_money_outlined, color: Colors.white),
      'bgColor': Color.fromARGB(255, 255, 167, 0),
      'page': PayCashScreen()
    },
    {
      'service': 'Pay Bills',
      'icon': const Icon(Icons.attach_money_outlined, color: Colors.white),
      'bgColor': Color.fromARGB(255, 228, 16, 104),
      'page': PayCashScreen()
    }
  ];

  // Banner data
  final List _bannerData = [
    {
      'image': '',
      'title': 'Recevie Money From the US 💸',
      'paragraph':
          'Receive money from friends & family in the US. it\'s instant',
      'buttonTilte': 'GET STARTED>',
      'btnFunc': () {},
      'activeColor': Color.fromARGB(255, 26, 26, 26),
    },
    {
      'image': '',
      'title': 'Recevie Money From the US 💸',
      'paragraph':
          'Receive money from friends & family in the US. it\'s instant',
      'buttonTilte': 'GET STARTED>',
      'btnFunc': () {},
      'activeColor': Color.fromARGB(255, 215, 215, 215),
    },
    {
      'image': '',
      'title': 'Recevie Money From the US 💸',
      'paragraph':
          'Receive money from friends & family in the US. it\'s instant',
      'buttonTilte': 'GET STARTED>',
      'btnFunc': () {},
      'activeColor': Color.fromARGB(255, 215, 215, 215),
    },
    {
      'image': '',
      'title': 'Recevie Money From the US 💸',
      'paragraph':
          'Receive money from friends & family in the US. it\'s instant',
      'buttonTilte': 'GET STARTED>',
      'btnFunc': () {},
      'activeColor': Color.fromARGB(255, 215, 215, 215),
    },
    {
      'image': '',
      'title': 'Recevie Money From the US 💸',
      'paragraph':
          'Receive money from friends & family in the US. it\'s instant',
      'buttonTilte': 'GET STARTED>',
      'btnFunc': () {},
      'activeColor': Color.fromARGB(255, 215, 215, 215),
    },
    {
      'image': '',
      'title': 'Recevie Money From the US 💸',
      'paragraph':
          'Receive money from friends & family in the US. it\'s instant',
      'buttonTilte': 'GET STARTED>',
      'btnFunc': () {},
      'activeColor': Color.fromARGB(255, 215, 215, 215),
    },
    {
      'image': '',
      'title': 'Recevie Money From the US 💸',
      'paragraph':
          'Receive money from friends & family in the US. it\'s instant',
      'buttonTilte': 'GET STARTED>',
      'btnFunc': () {},
      'activeColor': Color.fromARGB(255, 215, 215, 215),
    },
  ];

  late PageController _sliderPageViewController;

  // track current banner slider
  void trackCurrentBanener(bannerNum) {
    Color ac = Color.fromARGB(255, 26, 26, 26);
    Color dc = Color.fromARGB(255, 215, 215, 215);

    // set colors
    void updateBannerTrackerColor(b0, b1, b2, b3, b4, b5, b6) {
      _bannerData[0]['activeColor'] = b0;
      _bannerData[1]['activeColor'] = b1;
      _bannerData[2]['activeColor'] = b2;
      _bannerData[3]['activeColor'] = b3;
      _bannerData[4]['activeColor'] = b4;
      _bannerData[5]['activeColor'] = b5;
      _bannerData[6]['activeColor'] = b6;
    }

    if (bannerNum == 0.0) {
      setState(() {
        updateBannerTrackerColor(ac, dc, dc, dc, dc, dc, dc);
      });
    } else if (bannerNum == 1.0) {
      setState(() {
        updateBannerTrackerColor(dc, ac, dc, dc, dc, dc, dc);
      });
    } else if (bannerNum == 2.0) {
      setState(() {
        updateBannerTrackerColor(dc, dc, ac, dc, dc, dc, dc);
      });
    } else if (bannerNum == 3.0) {
      setState(() {
        updateBannerTrackerColor(dc, dc, dc, ac, dc, dc, dc);
      });
    } else if (bannerNum == 4.0) {
      setState(() {
        updateBannerTrackerColor(dc, dc, dc, dc, ac, dc, dc);
      });
    } else if (bannerNum == 5.0) {
      setState(() {
        updateBannerTrackerColor(dc, dc, dc, dc, dc, ac, dc);
      });
    } else if (bannerNum == 6.0) {
      setState(() {
        updateBannerTrackerColor(dc, dc, dc, dc, dc, dc, ac);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _sliderPageViewController = PageController();
    _sliderPageViewController.addListener(() {
      trackCurrentBanener(_sliderPageViewController.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PreformatPage.screenWidth(),
      child: Column(
        children: [
          // fixed appbar
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: PreformatPage.sideSpacing),
            height: PreformatPage.screenHeight() * .064,
            width: PreformatPage.screenWidth(),
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.help_outline_rounded,
                        color: AppColorScheme.blueColor,
                      ),
                      // label
                      Text('Help', style: AppFonts.labelFont1),
                    ],
                  ),
                ),
                // wallet
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Amount
                            Text(
                              'N2,100.61',
                              style: AppFonts.balanceFont,
                            ),
                            Gap(PreformatPage.useScreenWidth(3)),
                            // dropdown icon
                            Transform.rotate(
                                angle: pi / -.4,
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 16,
                                ))
                          ]),
                      // Gap(PreformatPage.useScreenHeight(3)),
                      // label
                      Text('Wallet', style: AppFonts.labelFont2)
                    ],
                  ),
                ),

                // profile
                GestureDetector(
                  onTap: () {},
                  child: Column(children: [
                    Icon(Icons.person_outline, color: AppColorScheme.blueColor),
                    // label
                    Text('Profile', style: AppFonts.labelFont1)
                  ]),
                )
              ],
            ),
          ),

          // section 2 services
          Container(
            height: (PreformatPage.screenHeight() - .06) * .669,
            width: PreformatPage.screenWidth(),
            // TODO: Copy color
            color: const Color.fromARGB(255, 247, 245, 247),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Gap(PreformatPage.useScreenHeight(25)),
                  // Quick services
                  Container(
                    width: PreformatPage.screenWidth(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            (_quickService as List<dynamic>).map((service) {
                          return Container(
                            padding: EdgeInsets.only(left: 18),
                            child: Column(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              service['page']));
                                },
                                child: Container(
                                  width: PreformatPage.useScreenWidth(84),
                                  height: PreformatPage.useScreenHeight(52),
                                  decoration: BoxDecoration(
                                      color: service['bgColor'],
                                      borderRadius: BorderRadius.circular(
                                          PreformatPage.useScreenHeight(50))),
                                  child: service['icon'],
                                ),
                              ),
                              Gap(PreformatPage.useScreenWidth(7)),
                              // Title
                              Text(
                                service['service'],
                                style: GoogleFonts.mulish(
                                    color: Color.fromARGB(255, 109, 109, 109)),
                              )
                            ]),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // card
                  Gap(PreformatPage.useScreenWidth(20)),
                  Container(
                    height: PreformatPage.useScreenHeight(165),
                    child: PageView(
                      controller: _sliderPageViewController,
                      scrollDirection: Axis.horizontal,
                      children: _bannerData.map((banner) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: HomeCard(),
                        );
                      }).toList(),
                    ),
                  ),

                  Gap(PreformatPage.useScreenHeight(20)),

                  // slider count tracker
                  Container(
                    width: PreformatPage.screenWidth() * .18,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_bannerData.length, (index) {
                        return Container(
                            height: PreformatPage.useScreenWidth(5),
                            width: PreformatPage.useScreenWidth(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _bannerData[index]['activeColor'],
                            ));
                      }),
                    ),
                  ),

                  Gap(PreformatPage.useScreenHeight(10)),

                  // Notication
                  HomeNotification1(),
                  HomeNotification1(),
                  HomeNotification1(),
                  HomeNotification1(),
                ],
              ),
            ),
          ),

          // request or send payment button
          Container(
            padding: EdgeInsets.only(
              left: PreformatPage.useScreenWidth(PreformatPage.sideSpacing),
              right: PreformatPage.useScreenWidth(PreformatPage.sideSpacing),
              top: PreformatPage.useScreenWidth(PreformatPage.sideSpacing),
            ),
            width: PreformatPage.screenWidth(),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: TransparentButton(
                      buttonFunction: () {}, buttonTitle: 'Request'),
                ),
                Gap(PreformatPage.useScreenWidth(10)),
                Flexible(
                    fit: FlexFit.loose,
                    child: PurpleButton(
                        buttonFunction: () {}, buttonTitle: 'Send'))
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _sliderPageViewController.dispose();
  }
}
