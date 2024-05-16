import 'package:flutter/material.dart';

import '../util/page.preformat.dart';
import '../util/color.scheme.dart';

class EmailInputWidget extends StatefulWidget {
  final bool isKeyboardClose;
  EmailInputWidget({required this.isKeyboardClose});

  @override
  _EmailInputWidgetState createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  Color inputBorderColor = AppColorScheme.nonActiveInputColor;
  bool isFieldActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: PreformatPage.screenWidth(),
        height: PreformatPage.useScreenWidth(52),
        decoration: BoxDecoration(
            border: Border.all(
                color: isFieldActive == true
                    ? AppColorScheme.activeInputColor
                    : AppColorScheme.nonActiveInputColor),
            borderRadius: BorderRadius.circular(PreformatPage.setBorderRadius)),
        child: TextField(
          onTap: () {
            setState(() {
              isFieldActive = true;
            });
          },
          onEditingComplete: () {
            setState(() {
              isFieldActive = false;
            });
          },
          textAlign: TextAlign.center,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Email'),
        ),
      ),
    );
  }
}
