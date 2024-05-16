//TODO: Remove this - NOTE: 'Incorrect use of ParentDataWidget' error not found here
// TODO: DEBUG: Error with inputField active after keyboard is closed and open again

import 'package:flutter/material.dart';

import '../util/page.preformat.dart';

class PhoneNumberInputField extends StatefulWidget {
  bool tapScreenToClosekeyboard;
  Function phoneString;
  PhoneNumberInputField({super.key, required this.tapScreenToClosekeyboard, required this.phoneString});

  @override
  State<PhoneNumberInputField> createState() => _PhoneNumberInputFieldState();
}

class _PhoneNumberInputFieldState extends State<PhoneNumberInputField> {
  bool _isInputFieldActive = false;
  final Color _inputFieldActiveColor = Color.fromARGB(255, 129, 71, 246);
  final Color _inputFieldNotActiveColor = Color.fromARGB(255, 224, 209, 255);
  Color _inputFieldColor = Color.fromARGB(255, 224, 209, 255);

  Color keyboardActivatedColor(ctx) {
    final isKeyboardOnScreen = MediaQuery.of(ctx).viewInsets.bottom;
    if (isKeyboardOnScreen > 0 || _isInputFieldActive == true) {
      _inputFieldColor = _inputFieldActiveColor;
    } else if (isKeyboardOnScreen <= 0 || _isInputFieldActive == false) {
      _inputFieldColor = _inputFieldNotActiveColor;
      // TODO: widget.tapScreenToClosekeyboard = false;
    }
    return _inputFieldColor;
  }

  @override
  Widget build(BuildContext context) {
    // use keyboard to activate input field
    final isKeyboardOnScreen = MediaQuery.of(context).viewInsets;

    return Container(
      height: PreformatPage.useScreenWidth(52),
      width: PreformatPage.screenWidth(),
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.tapScreenToClosekeyboard != false
                ? keyboardActivatedColor(context)
                : _inputFieldNotActiveColor),
        borderRadius: BorderRadius.circular(PreformatPage.useScreenHeight(6)),
      ),
      child: Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: PreformatPage.screenWidth() * .2,
            height: PreformatPage.useScreenWidth(52),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        color: widget.tapScreenToClosekeyboard != false
                            ? keyboardActivatedColor(context)
                            : _inputFieldNotActiveColor))),
            child: Row(children: [
              // country flag
              // dropdown icon
            ]),
          ),
          Flexible(
              fit: FlexFit.tight,
              child: TextField(
                // TODO: Max text length
                onTap: () {
                  setState(() {
                    _isInputFieldActive = true;
                    keyboardActivatedColor(context);
                    _inputFieldColor;
                  });
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: '+234 xxxxxxxxxx',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .03)),
              ))
        ],
      )),
    );
  }
}
