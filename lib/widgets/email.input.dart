import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/page.preformat.dart';
import '../util/color.scheme.dart';

class EmailInputWidget extends StatefulWidget {
  final bool isKeyboardClose;
  Function emailString;
  EmailInputWidget({required this.isKeyboardClose, required this.emailString});

  @override
  _EmailInputWidgetState createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  bool _isKeyboardVisible = false;
  bool _isInputFieldActive = false;

  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // we only want to check if keyboard is on screen if there's frame(s) rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    });
  }

  // use a getter to combine all logic
  Color _inputBorderColor = AppColorScheme.nonActiveInputColor;

  Color get fieldColor {
    if (_isInputFieldActive == true || _isKeyboardVisible == true) {
      _inputBorderColor = AppColorScheme.activeInputColor;
      print('True');
    } else if (_isInputFieldActive == false || _isKeyboardVisible == false) {
      _inputBorderColor = AppColorScheme.nonActiveInputColor;
      print('False');
    } else if (widget.isKeyboardClose == true) {
      _inputBorderColor = AppColorScheme.nonActiveInputColor;
    } else {
      _inputBorderColor;
      print('Normal');
    }

    return _inputBorderColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: PreformatPage.useScreenWidth(52),
      width: PreformatPage.screenWidth(),
      decoration: BoxDecoration(
        border: Border.all(
          color: fieldColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(PreformatPage.useScreenHeight(6)),
      ),
      child: TextField(
        controller: emailController,
        decoration:
            const InputDecoration(border: InputBorder.none, hintText: 'Email'),
        textAlign: TextAlign.center,
        onTap: () {
          setState(() {
            _isInputFieldActive = true;
          });
        },
        onEditingComplete: () {
          widget.emailString(emailController.text);
          setState(() {
            _isInputFieldActive = false;
          });
          FocusScope.of(context).unfocus();
        },

        onChanged: (v) => widget.emailString(v),
      ),
    );
  }
}
