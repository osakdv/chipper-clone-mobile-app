import 'dart:io';
import 'dart:math';

import 'package:chipper_clone/screens/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import './onboarding.dart';
import '../util/page.preformat.dart';
import '../widgets/buttons.dart';
import '../widgets/phone.input.dart';
import '../widgets/email.input.dart';
import '../util/color.scheme.dart';
import '../widgets/input.error.msg.dart';
import '../models/user.details.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // unfocus any keyboard focus mode will change inputFieldFocus to false so it can deactivate the focus mode
  bool isKeyboardClosed = false;

  // This function is to switch between email and phone input
  bool usePhone = true;
  String transparentBtnText = 'Use Email';
  void useNumberOrEmailFunc() {
    if (usePhone == true) {
      usePhone = false;
      setState(() {
        transparentBtnText = 'Use Phone';
      });
    } else if (usePhone == false) {
      usePhone = true;
      setState(() {
        transparentBtnText = 'Use Email';
      });
    }
  }

  // get input data from input fieds using a callback function to be call inside the child widget
  var userEmail = '';
  var userPhoneNum = '';

  bool errNotifier = false;
  var errMessage = '';

  getUserEmailString(inputString) {
    userEmail = inputString;
  }

  getUserPhoneNum(inputString) {
    userPhoneNum = inputString;
  }

  void nextPage() {
    if (usePhone == false) {
      if (userEmail.isEmpty) {
        setState(() {
          errNotifier = true;
          errMessage = 'Please enter a valid email address';
        });
      } else {
        newLoginAttempt.add({'phoneNo': null, 'email': userEmail});
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => OtpPage()));
      }
    }
  }

  // andriod bottom spacing
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
    final Widget loginPageContent = SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // return button
          Gap(PreformatPage.useScreenHeight(16)),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnboardingScreen()));
                  },
                  child: Transform.rotate(
                      angle: pi / .2,
                      child: Icon(
                        Icons.arrow_forward,
                        color: AppColorScheme.iconColor1,
                      ))),
            ),
          ),
          // text
          Gap(PreformatPage.useScreenHeight(16)),
          Text(
            usePhone == true
                ? 'Enter your mobile number to continue'
                : 'Enter your email address to continue',
            style:
                GoogleFonts.mulish(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          // form field
          Padding(
            padding: EdgeInsets.only(
                left: PreformatPage.useScreenWidth(PreformatPage.sideSpacing),
                right: PreformatPage.useScreenWidth(PreformatPage.sideSpacing),
                top: PreformatPage.useScreenHeight(PreformatPage.sideSpacing)),
            child: usePhone == true
                ? PhoneNumberInputField(
                    tapScreenToClosekeyboard: isKeyboardClosed,
                    phoneString: getUserPhoneNum)
                // TODO: come here
                : EmailInputWidget(
                    isKeyboardClose: isKeyboardClosed,
                    emailString: getUserEmailString),
          ),
          if (errNotifier == true)
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: InputErrorMsg(),
            ),
          // buttons
          Spacer(),
          Container(
            padding: EdgeInsets.only(
                left: PreformatPage.useScreenWidth(PreformatPage.sideSpacing),
                right: PreformatPage.useScreenWidth(PreformatPage.sideSpacing),
                bottom: MediaQuery.of(context).viewInsets.bottom * .05),
            width: PreformatPage.screenWidth(),
            child: Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: TransparentButton(
                          buttonFunction: useNumberOrEmailFunc,
                          buttonTitle: transparentBtnText),
                    ),
                    Gap(PreformatPage.useScreenWidth(10)),
                    Flexible(
                        fit: FlexFit.loose,
                        child: PurpleButton(
                            buttonFunction: nextPage, buttonTitle: 'Next'))
                  ],
                )),
          ),
          // Gap(PreformatPage.useScreenHeight(MediaQuery.of(context).padding.bottom * -0.8)),
          andriodBtmSpacing
        ],
      ),
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isKeyboardClosed = true;
        });
        print('here ${isKeyboardClosed}');
      },
      child: Scaffold(
        body: loginPageContent,
      ),
    );
  }
}
