import 'dart:io';

import 'package:chipper_clone/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

import '../models/user.details.dart';
import '../util/page.preformat.dart';
import '../util/color.scheme.dart';
import 'dashboard.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String contact = '';
  late bool isPhone;

//This gets recent sign in details based on email or phone number - quick approach. Standard is to store the user entry in the input to a variable - see if it is an email or phone and then use it query db for existence
  dynamic get userPhoneOrEmail {
    // access the recent user
    if (newLoginAttempt[newLoginAttempt.length - 1]['email'] == null) {
      contact = newLoginAttempt[newLoginAttempt.length - 1]['phoneNo'];
      isPhone = true;
    } else {
      contact = newLoginAttempt[newLoginAttempt.length - 1]['email'];
      isPhone = false;
    }
    return contact;
  }

  // navigate to dashboard

  // manual otp code
  int otpCode = 000012;

  // check if the otp entry is up to 6 digits and if it's the manual one entererd
  void otpCompleteThenNavigate(String inputEntry) {
    if (inputEntry.length == 6 && int.parse(inputEntry) == otpCode) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Dashboard()));
    }
  }

  // because list only expects a widget, it must use code that returns a widget immediately
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
    final otpPageBody = SafeArea(
      child: Column(
        children: [
          Gap(PreformatPage.useScreenHeight(16)),

          Align(
            alignment: Alignment.center,
            child: Text(
              'Please enter the 6 digit code we sent to $userPhoneOrEmail',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.mulish(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),

          Gap(PreformatPage.useScreenHeight(16)),

          // otp-input
          Container(
            height: PreformatPage.useScreenWidth(52),
            width: PreformatPage.screenWidth() * .65,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColorScheme.activeInputColor,
                width: 1,
              ),
              borderRadius:
                  BorderRadius.circular(PreformatPage.useScreenHeight(6)),
            ),
            child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: PreformatPage.useScreenWidth(8)),
                  hintText: 'Type in  \'00012\'',
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  otpCompleteThenNavigate(val);
                }),
          ),
          Gap(PreformatPage.useScreenHeight(20)),

          if (isPhone) const Text('Or'),

          Gap(PreformatPage.useScreenHeight(40)),

          // should use registered with phone number
          !isPhone
              ? Text(
                  'Still haven\'t received code? Click to resend',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColorScheme.activeInputColor),
                )
              : Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: PreformatPage.screenWidth() * .65,
                        height: PreformatPage.useScreenHeight(52),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 115, 58, 229),
                            borderRadius: BorderRadius.circular(
                                PreformatPage.useScreenHeight(14))),
                        child: Text(
                          'Tap to verify with ussd',
                          style: GoogleFonts.mulish(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Gap(PreformatPage.useScreenHeight(4)),
                    Text(
                      'This is a free service',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),

          Gap(PreformatPage.useScreenHeight(40)),

          // go back
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()));
            },
            child: Text(
              'Go back',
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColorScheme.activeInputColor),
            ),
          ),
          andriodBtmSpacing
        ],
      ),
    );

    return Scaffold(
      body: otpPageBody,
    );
  }
}
