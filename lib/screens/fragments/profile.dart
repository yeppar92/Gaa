import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/common.dart';
import '../../common/custom_colors.dart';
import '../../common/custom_strings.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/text_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkForPref();
  }

  @override
  void dispose() {
    super.dispose();

  }

  checkForPref() async {

  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child:  WillPopScope(
            onWillPop: () async {

              return false;
            },
            child : Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                appBar : AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: Text(''),
                  centerTitle: true,
                  elevation: 0.0,
                ),
                body:  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/back.jpg"),
                          fit: BoxFit.cover),
                    ),
                    alignment: Alignment.center,
                    child : SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 50),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 40),
                            height: 140,
                            width: 140,
                            child: CircleAvatar(
                              backgroundColor: Common.colorAccent,
                              radius: 16.0,
                              child: ClipRRect(
                                child: Image.asset(
                                    'assets/images/placeholder.png'),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            )),
                        const SizedBox(height: 50,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset('assets/images/settingicon.png'),
                                  const TextWidget(text: Customstrings.proSetting,
                                      txtColor: CustomColors.colorWhite,
                                      fontFamily: 'PoppinMedium',
                                      fontSize: 12.0,
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                            Expanded(

                              child: Column(
                                children: [
                                  Image.asset('assets/images/historyicon.png'),
                                  const TextWidget(text: Customstrings.proSetting,
                                      txtColor: CustomColors.colorWhite,
                                      fontFamily: 'PoppinMedium',
                                      fontSize: 12.0,
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        TextFieldWidget(
                          onPressed: () {
                            setState(() {

                            });
                          },
                          controller: nameController,
                          textInputType: TextInputType.text,
                          maxLength: 100,
                          cursorColor: CustomColors.colorWhite,
                          fillColor: CustomColors.colorTextField,
                          hintTxt: Customstrings.name,
                          txtColor: CustomColors.colorWhite,
                          hintColor: CustomColors.colorWhite,
                          enableColor: Colors.white,
                          focusColor: Colors.white,
                          obsucureTxt: false,
                          checkPass: false,
                          checkPrefix: true,
                          assetUrl: 'assets/images/prousericon.png',
                          circularSize: 30.0,
                          height: 50.0,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          onPressed: () {
                            setState(() {

                            });
                          },
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          maxLength: 100,
                          cursorColor: CustomColors.colorWhite,
                          fillColor: CustomColors.colorTextField,
                          hintTxt: Customstrings.email,
                          txtColor: CustomColors.colorWhite,
                          hintColor: CustomColors.colorWhite,
                          enableColor: Colors.white,
                          focusColor: Colors.white,
                          obsucureTxt: false,
                          checkPass: false,
                          checkPrefix: true,
                          assetUrl: 'assets/images/mailicon.png',
                          circularSize: 30.0,
                          height: 50.0,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          onPressed: () {
                            setState(() {

                            });
                          },
                          controller: phoneController,
                          textInputType: TextInputType.phone,
                          maxLength: 10,
                          cursorColor: CustomColors.colorWhite,
                          fillColor: CustomColors.colorTextField,
                          hintTxt: Customstrings.phoneno,
                          txtColor: CustomColors.colorWhite,
                          hintColor: CustomColors.colorWhite,
                          enableColor: Colors.white,
                          focusColor: Colors.white,
                          obsucureTxt: false,
                          checkPass: false,
                          checkPrefix: true,
                          assetUrl: 'assets/images/shakephone.png',
                          circularSize: 30.0,
                          height: 50.0,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          onPressed: () {
                            setState(() {

                            });
                          },
                          controller: companyController,
                          textInputType: TextInputType.text,
                          maxLength: 100,
                          cursorColor: CustomColors.colorWhite,
                          fillColor: CustomColors.colorTextField,
                          hintTxt: Customstrings.company,
                          txtColor: CustomColors.colorWhite,
                          hintColor: CustomColors.colorWhite,
                          enableColor: Colors.white,
                          focusColor: Colors.white,
                          obsucureTxt: false,
                          checkPass: false,
                          checkPrefix: true,
                          assetUrl: 'assets/images/company.png',
                          circularSize: 30.0,
                          height: 50.0,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          onPressed: () {
                            setState(() {

                            });
                          },
                          controller: countryController,
                          textInputType: TextInputType.text,
                          maxLength: 100,
                          cursorColor: CustomColors.colorWhite,
                          fillColor: CustomColors.colorTextField,
                          hintTxt: Customstrings.country,
                          txtColor: CustomColors.colorWhite,
                          hintColor: CustomColors.colorWhite,
                          enableColor: Colors.white,
                          focusColor: Colors.white,
                          obsucureTxt: false,
                          checkPass: false,
                          checkPrefix: true,
                          assetUrl: 'assets/images/country.png',
                          circularSize: 30.0,
                          height: 50.0,
                          width: double.infinity,
                        ),

                      ],
                    )))

            )));
  }


}
