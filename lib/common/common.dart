import 'dart:io';
import 'dart:math';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ars_progress_dialog/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Common {
  static String mainurl = "https://snip-x.yeorder.com/api/v1/";
 
  static const Color colorAccent = Color(0xff01499B);
  static const Color tfbackColor = Color(0xff12A1E44);
  static const Color list_divider = Color(0xff1d9d9d9);
  static const Color rippleColor = Color(0xff101499B);
  static const Color btColor = Color(0xff109499B);
  static const Color txtColor = Color(0xff12f2f2f);
  static const Color hintColor = Color(0xff1575757);
  
  static late Color colorCode;
  static late ArsProgressDialog customProgressDialog;

  static void showToast(String body, String colorValue) {
    if (colorValue == 'red') {
      colorCode = Colors.red;
    } else if (colorValue == 'green') {
      colorCode = Colors.green;
    }

    Fluttertoast.showToast(
        msg: body,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: colorCode,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showLoaderDialog(BuildContext context) {
    customProgressDialog = ArsProgressDialog(
        context,
        blur: 2,
        dismissable: false,
        backgroundColor: const Color(0x3331295C),
        animationDuration: const Duration(milliseconds: 500));

    customProgressDialog.show(); // show dialog


  }

  static SetPreferences(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  static getPreferences(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    final String value = myPrefs.getString(key) ?? "";
    return value;
  }

  static bool isValidEmail(String em) {
    bool emailValid =
    RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(em);
    print(emailValid);
    return emailValid;
  }

  static Handlenull(String value) {
    String check = "";
    if (value != "null") {
      check = value;
    }
    return check;
  }

  static fileExistOrNot(String path) async {
    var check = false;
    var dir = await DownloadsPathProvider.downloadsDirectory;
    var downloadFolder = "${dir!.path}/$path";
    print(downloadFolder);
    if (await File(downloadFolder).exists()) {
     check = true;
    } else {
    check = false;
    }
    return check;
  }

  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }


  static void fieldFocusChanged(BuildContext context,FocusNode currentFocus,FocusNode nextFocus) {
   currentFocus.unfocus();
   FocusScope.of(context).requestFocus(nextFocus);
  }












}
