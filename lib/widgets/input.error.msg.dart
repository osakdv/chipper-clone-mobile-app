import 'package:flutter/material.dart';

class InputErrorMsg extends StatelessWidget {
  const InputErrorMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(223, 255, 81, 68),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text('Please enter a valid email address', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),
    );
  }
}
