import 'package:flutter/material.dart';

class Calcbutton extends StatelessWidget {
  final String btnTxt;
  final Color btnColor;
  final Color txtColor;
  final Function buttonPressed;
  const Calcbutton({
    Key? key,
    required this.btnTxt,
    required this.btnColor,
    required this.txtColor,
    required this.buttonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: TextButton(
        onPressed: () {
          buttonPressed(btnTxt);
        },
        child: Text(btnTxt),
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 30),
          primary: txtColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
      ),
    );
  }
}
