import 'dart:io';

import 'package:chipper_clone/util/page.preformat.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/slides.dart';
import '../util/page.preformat.dart';
import '../widgets/buttons.dart';
import './login.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // create a list of data for my pageview widget
  final List _slideDataContent = [
    {
      'logoOnSlide': 'assets/imgs/chipper-logo.png',
      'imageOnSlide': null,
      'slideTitle': 'Welcome \nto Chipper',
      'slideParagraph':
          'The borderless way to move money across town, across Africa, or across an ocean.',
      'activeColor': Color.fromARGB(255, 129, 71, 246)
    },
    {
      'logoOnSlide': 'assets/imgs/chipper-logo.png',
      'imageOnSlide': null,
      'slideTitle': 'Move money\nacross borders',
      'slideParagraph':
          'The borderless way to move money across town, across Africa, or across an ocean.',
      'activeColor': Color.fromARGB(255, 213, 197, 246),
    },
    {
      'logoOnSlide': 'assets/imgs/chipper-logo.png',
      'imageOnSlide': null,
      'slideTitle': 'Collect Payments\nfrom Anyone',
      'slideParagraph':
          'The borderless way to move money across town, across Africa, or across an ocean.',
      'activeColor': Color.fromARGB(255, 213, 197, 246),
    },
    {
      'logoOnSlide': 'assets/imgs/chipper-logo.png',
      'imageOnSlide': null,
      'slideTitle': 'Buy airtime for\nyourself and others',
      'slideParagraph':
          'The borderless way to move money across town, across Africa, or across an ocean.',
      'activeColor': Color.fromARGB(255, 213, 197, 246),
    },
  ];

  // track current page
  late PageController _controller;

  void trackCurrentPageNum(pageNum) {
    // Active color and deactivated color
    const Color ac = Color.fromARGB(255, 129, 71, 246);
    const Color dc = Color.fromARGB(255, 213, 197, 246);

    void pageTrackerColor(c1, c2, c3, c4) {
      _slideDataContent[0]['activeColor'] = c1;
      _slideDataContent[1]['activeColor'] = c2;
      _slideDataContent[2]['activeColor'] = c3;
      _slideDataContent[3]['activeColor'] = c4;
    }

    if (pageNum == 0.0) {
      setState(() {
        pageTrackerColor(ac, dc, dc, dc);
      });
    } else if (pageNum == 1.0) {
      setState(() {
        pageTrackerColor(dc, ac, dc, dc);
      });
    } else if (pageNum == 2.0) {
      setState(() {
        pageTrackerColor(dc, dc, ac, dc);
      });
    } else if (pageNum == 3.0) {
      setState(() {
        pageTrackerColor(dc, dc, dc, ac);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(() {
      trackCurrentPageNum(_controller.page);
    });
  }

  // navigate page
  void _openLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  
  // For some reason i could not put in the direct body of code, the list expects a widget
  get andriodBtmSpacing {
    if (Platform.isAndroid) {
      return Gap(PreformatPage.useScreenHeight(20));
    }
    else {
      return Gap(PreformatPage.useScreenHeight(0));
    }
    // return spaceGap;
  }

  @override
  Widget build(BuildContext context) {
    // sizing
    final screenSize = MediaQuery.of(context).size;

    final Widget _onboardingContent = SafeArea(
      child: Container(
        height: screenSize.height,
        child: Column(
          children: [
            Gap(screenSize.height * .18),

            // slides
            Container(
              height: (screenSize.height - (screenSize.height * .18)) * .6,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: _slideDataContent.map((widgetSlide) {
                  return Slides(
                      logoOnSlide: widgetSlide['logoOnSlide'],
                      imageOnSlide: widgetSlide['imageOnSlide'],
                      slideTitle: widgetSlide['slideTitle'],
                      slideParagraph: widgetSlide['slideParagraph'],
                      activeColor: widgetSlide['activeColor'],
                      slideContentsList: _slideDataContent);
                }).toList(),
              ),
            ),

            Gap(PreformatPage.useScreenHeight(10)),

            // current slide tracker
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: PreformatPage.useScreenHeight(25.00)),
              child: Row(
                children: List.generate(_slideDataContent.length, (index) {
                  return Row(
                    children: [
                      Container(
                        width: PreformatPage.useScreenWidth(38),
                        height: 2,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(50),
                            color: _slideDataContent[index]['activeColor']),
                      ),
                      Gap(PreformatPage.useScreenWidth(10))
                    ],
                  );
                }),
              ),
            ),

            Spacer(),
            // create or login buttons
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: PreformatPage.useScreenHeight(25.00)),
                child: PurpleButton(
                    buttonFunction: () {}, buttonTitle: 'Open free account')),
            Gap(PreformatPage.useScreenHeight(10)),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: PreformatPage.useScreenHeight(25.00)),
              child: TransparentButton(
                  buttonFunction: () {
                    _openLoginPage();
                  },
                  buttonTitle: 'I have an account'),
            ),
            andriodBtmSpacing
          ],
        ),
      ),
    );

    return Scaffold(body: _onboardingContent);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
