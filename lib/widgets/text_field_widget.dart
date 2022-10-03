import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget{
  final VoidCallback onPressed;
  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLength;
  final Color cursorColor;
  final Color fillColor;
  final Color txtColor;
  final String hintTxt;
  final Color hintColor;
  final Color enableColor;
  final Color focusColor;
  final  bool obsucureTxt;
  final  bool checkPass;
  final  bool checkPrefix;
  final  String assetUrl;
  final double circularSize;
  final double height;
  final double width;

  const TextFieldWidget({super.key,
    required this.onPressed,
    required this.controller,
    required this.textInputType,
    required this.maxLength,
    required this.cursorColor,
    required this.fillColor,
    required this.txtColor,
    required this.hintTxt,
    required this.hintColor,
    required this.enableColor,
    required this.focusColor,
    required this.obsucureTxt,
    required this.checkPass,
    required this.checkPrefix,
    required this.assetUrl,
    required this.circularSize,
    required this.height,
    required this.width});

  @override
  Widget build(BuildContext context){

    return SizedBox(
        height: height,
        width: width,
        child : TextField(
      controller: controller,
      cursorColor: cursorColor,
      obscureText: obsucureTxt,
      keyboardType: textInputType,
      maxLength: maxLength,
      style:  TextStyle(
        color: txtColor,
      ),
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(
              color: enableColor),
          borderRadius:
          BorderRadius.circular(30.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:  BorderSide(
              color:focusColor),
          borderRadius:
          BorderRadius.circular(circularSize),

        ),
        hintText: " $hintTxt",
        counterText: "",
        hintStyle:  TextStyle(
          color: hintColor,
        ),


        suffixIcon: checkPass?IconButton(
          icon: Icon(
              !obsucureTxt
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: hintColor),
          onPressed: () => onPressed.call()
        ):null,

          prefixIcon:  checkPrefix?Image.asset(
            assetUrl,
            width: 10,
            height: 10,

          ):null
      ),
    ));
  }
}