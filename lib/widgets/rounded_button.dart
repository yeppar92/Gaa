import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final VoidCallback onPressed;
 final Color textColor;
 final Color btnColor;
 final Color rippleColor;
 final Color borderColor;
 final String text;
 final double height;
 final double width;
  final double fontSize;
 final double circularSize;

   const RoundedButton({super.key,
       required this.onPressed,
       required this.textColor,
       required this.btnColor,
       required this.rippleColor,
       required this.borderColor,
       required this.text,
       required this.height,
       required this.width,
       required this.fontSize,
       required this.circularSize});

  @override
  Widget build(BuildContext context){
    return SizedBox(
     height: height,
     width: width,
     child: TextButton(
      style: ButtonStyle(
          backgroundColor:
          MaterialStateColor.resolveWith(
                  (states) =>
              btnColor),
          overlayColor:
          MaterialStateColor.resolveWith(
                  (states) =>
              rippleColor),
          shape: MaterialStateProperty.all<
              RoundedRectangleBorder>(
              RoundedRectangleBorder(
               borderRadius:
               BorderRadius.circular(circularSize),
               side:  BorderSide(
                   color: borderColor),
              ))),

      onPressed:() {
        onPressed.call();
       },
      child: Text(
       text,
       style:  TextStyle(
           color: Colors.white,
           fontSize: fontSize,
           fontFamily: 'PoppinMedium'),
      ),
     ),
    );
  }
}