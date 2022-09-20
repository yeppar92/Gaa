import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget{
  final String text;
  final Color txtColor;
  final String  fontFamily;
  final double fontSize;
  final TextAlign textAlign;

  const TextWidget({super.key,
    required this.text,
    required this.txtColor,
    required this.fontFamily,
    required this.fontSize,
    required this.textAlign});

  @override
  Widget build(BuildContext context){

    return Text(
      text,
      textAlign: textAlign,
      style:  TextStyle(
          color: txtColor,
          fontSize: fontSize,
          fontFamily: fontFamily),
    );
  }
}