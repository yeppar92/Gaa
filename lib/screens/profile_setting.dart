import 'package:daa/common/custom_colors.dart';
import 'package:daa/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daa/widgets/text_widget.dart';
import '../../common/common.dart';
import '../../common/custom_strings.dart';
import '../../widgets/text_field_widget.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  ProfileSettingState createState() => ProfileSettingState();
}

class ProfileSettingState extends State<ProfileSetting> {
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    checkForPref();
  }

  @override
  void dispose() {
    super.dispose();
  }

  checkForPref() async {}

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text(''),
                  centerTitle: true,
                  elevation: 0.0,
                ),
                body: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/back.jpg"),
                          fit: BoxFit.cover),
                    ),
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/settingicon.png'),
                                const TextWidget(
                                    text: Customstrings.proSetting,
                                    txtColor: CustomColors.colorWhite,
                                    fontFamily: 'PoppinMedium',
                                    fontSize: 14.0,
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/paymathodicon.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const TextWidget(
                                          text: Customstrings.payMathods,
                                          txtColor: CustomColors.colorWhite,
                                          fontFamily: 'PoppinMedium',
                                          fontSize: 11.0,
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/lockicon.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      const TextWidget(
                                          text: Customstrings.changePass,
                                          txtColor: CustomColors.colorWhite,
                                          fontFamily: 'PoppinMedium',
                                          fontSize: 11.0,
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                             Container(
                              margin: const EdgeInsets.only(left: 15),
                              alignment: Alignment.topLeft,
                              child: const TextWidget(
                                  text: Customstrings.name,
                                  txtColor: CustomColors.colorWhite,
                                  fontFamily: 'PoppinBold',
                                  fontSize: 11.0,
                                  textAlign: TextAlign.left),
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            TextFieldWidget(
                              onPressed: () {
                                setState(() {});
                              },
                              controller: nameController,
                              textInputType: TextInputType.text,
                              maxLength: 100,
                              cursorColor: CustomColors.colorWhite,
                              fillColor: CustomColors.colorTextField,
                              hintTxt: "",
                              txtColor: CustomColors.colorWhite,
                              hintColor: CustomColors.colorWhite,
                              enableColor: Colors.white,
                              focusColor: Colors.white,
                              obsucureTxt: false,
                              checkPass: false,
                              checkPrefix: false,
                              assetUrl: 'assets/images/prousericon.png',
                              circularSize: 30.0,
                              height: 50.0,
                              width: double.infinity,
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              alignment: Alignment.topLeft,
                              child: const TextWidget(
                                  text: Customstrings.email,
                                  txtColor: CustomColors.colorWhite,
                                  fontFamily: 'PoppinBold',
                                  fontSize: 11.0,
                                  textAlign: TextAlign.left),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldWidget(
                              onPressed: () {
                                setState(() {});
                              },
                              controller: nameController,
                              textInputType: TextInputType.emailAddress,
                              maxLength: 100,
                              cursorColor: CustomColors.colorWhite,
                              fillColor: CustomColors.colorTextField,
                              hintTxt: "",
                              txtColor: CustomColors.colorWhite,
                              hintColor: CustomColors.colorWhite,
                              enableColor: Colors.white,
                              focusColor: Colors.white,
                              obsucureTxt: false,
                              checkPass: false,
                              checkPrefix: false,
                              assetUrl: 'assets/images/mailicon.png',
                              circularSize: 30.0,
                              height: 50.0,
                              width: double.infinity,
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              alignment: Alignment.topLeft,
                              child: const TextWidget(
                                  text: Customstrings.phoneno,
                                  txtColor: CustomColors.colorWhite,
                                  fontFamily: 'PoppinBold',
                                  fontSize: 11.0,
                                  textAlign: TextAlign.left),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldWidget(
                              onPressed: () {
                                setState(() {});
                              },
                              controller: nameController,
                              textInputType: TextInputType.phone,
                              maxLength: 10,
                              cursorColor: CustomColors.colorWhite,
                              fillColor: CustomColors.colorTextField,
                              hintTxt: "",
                              txtColor: CustomColors.colorWhite,
                              hintColor: CustomColors.colorWhite,
                              enableColor: Colors.white,
                              focusColor: Colors.white,
                              obsucureTxt: false,
                              checkPass: false,
                              checkPrefix: false,
                              assetUrl: 'assets/images/shakephone.png',
                              circularSize: 30.0,
                              height: 50.0,
                              width: double.infinity,
                            ),
                            const SizedBox(
                              height: 15,
                            ),


                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              alignment: Alignment.topLeft,
                              child: const TextWidget(
                                  text: Customstrings.company,
                                  txtColor: CustomColors.colorWhite,
                                  fontFamily: 'PoppinBold',
                                  fontSize: 11.0,
                                  textAlign: TextAlign.left),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldWidget(
                              onPressed: () {
                                setState(() {});
                              },
                              controller: nameController,
                              textInputType: TextInputType.text,
                              maxLength: 100,
                              cursorColor: CustomColors.colorWhite,
                              fillColor: CustomColors.colorTextField,
                              hintTxt: "",
                              txtColor: CustomColors.colorWhite,
                              hintColor: CustomColors.colorWhite,
                              enableColor: Colors.white,
                              focusColor: Colors.white,
                              obsucureTxt: false,
                              checkPass: false,
                              checkPrefix: false,
                              assetUrl: 'assets/images/company.png',
                              circularSize: 30.0,
                              height: 50.0,
                              width: double.infinity,
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              alignment: Alignment.topLeft,
                              child: const TextWidget(
                                  text: Customstrings.country,
                                  txtColor: CustomColors.colorWhite,
                                  fontFamily: 'PoppinBold',
                                  fontSize: 11.0,
                                  textAlign: TextAlign.left),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldWidget(
                              onPressed: () {
                                setState(() {});
                              },
                              controller: nameController,
                              textInputType: TextInputType.text,
                              maxLength: 100,
                              cursorColor: CustomColors.colorWhite,
                              fillColor: CustomColors.colorTextField,
                              hintTxt: "",
                              txtColor: CustomColors.colorWhite,
                              hintColor: CustomColors.colorWhite,
                              enableColor: Colors.white,
                              focusColor: Colors.white,
                              obsucureTxt: false,
                              checkPass: false,
                              checkPrefix: false,
                              assetUrl: 'assets/images/country.png',
                              circularSize: 30.0,
                              height: 50.0,
                              width: double.infinity,
                            ),
                          ],
                        ))))));
  }
}
