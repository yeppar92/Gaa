import 'package:daa/common/custom_colors.dart';
import 'package:daa/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daa/widgets/text_widget.dart';
import '../../common/common.dart';
import '../../common/custom_strings.dart';
import '../../widgets/text_field_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
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

                appBar : AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Common.colorAccent,
                  title: Image.asset(
                    'assets/images/splashlogo.png',
                    height: 50,
                    width: 50,
                  ),

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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 40,right: 40),
                                child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Expanded(child: TextWidget(text: Customstrings.licenseRegisterDate,
                                          txtColor: CustomColors.colorWhite,
                                          fontFamily: 'PoppinBold',
                                          fontSize: 12.0,
                                          textAlign: TextAlign.center),),
                                      Expanded(child:  TextWidget(text: Customstrings.licenseExpiryDate,
                                          txtColor: CustomColors.colorWhite,
                                          fontFamily: 'PoppinBold',
                                          fontSize: 12.0,
                                          textAlign: TextAlign.center))

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Expanded(child: TextWidget(text: Customstrings.date,
                                          txtColor: CustomColors.colorWhite,
                                          fontFamily: 'PoppinBold',
                                          fontSize: 12.0,
                                          textAlign: TextAlign.center),),
                                      Expanded(child:  TextWidget(text: Customstrings.expirydate,
                                          txtColor: CustomColors.colorWhite,
                                          fontFamily: 'PoppinBold',
                                          fontSize: 12.0,
                                          textAlign: TextAlign.center))

                                    ],
                                  ),
                                ],
                              )
                            ),
                            const SizedBox(height: 15,),
                            Container(
                              margin: const EdgeInsets.only(left: 40,right: 40),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child:  Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                                          borderRadius: const BorderRadius.only(topLeft : Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: const TextWidget(text: '2022-01-03',
                                            txtColor: CustomColors.colorWhite,
                                            fontFamily: 'PoppinMedium',
                                            fontSize: 15.0,
                                            textAlign: TextAlign.center),
                                      )),
                                      Expanded(child:    Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                                          borderRadius: const BorderRadius.only(topRight : Radius.circular(5),bottomRight: Radius.circular(5)),
                                        ),
                                        child: const TextWidget(text: '2022-01-03',
                                            txtColor: CustomColors.colorWhite,
                                            fontFamily: 'PoppinMedium',
                                            fontSize: 15.0,
                                            textAlign: TextAlign.center),
                                      ))

                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Expanded(child:  Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                                          borderRadius: const BorderRadius.only(topLeft : Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: const TextWidget(text: '2022-01-03',
                                            txtColor: CustomColors.colorWhite,
                                            fontFamily: 'PoppinMedium',
                                            fontSize: 15.0,
                                            textAlign: TextAlign.center),
                                      )),
                                      Expanded(child:    Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                                          borderRadius: const BorderRadius.only(topRight : Radius.circular(5),bottomRight: Radius.circular(5)),
                                        ),
                                        child: const TextWidget(text: '2022-01-03',
                                            txtColor: CustomColors.colorWhite,
                                            fontFamily: 'PoppinMedium',
                                            fontSize: 15.0,
                                            textAlign: TextAlign.center),
                                      ))

                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                 height: 110,
                                  width: 110,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/blueeclipse.png"),
                                        fit: BoxFit.cover),
                                  ),
                                  child: const TextWidget(text: '1',
                                      txtColor: CustomColors.colorWhite,
                                      fontFamily: 'PoppinMedium',
                                      fontSize: 40.0,
                                      textAlign: TextAlign.center)

                                ),
                                const SizedBox(width: 80,),
                                Container(
                                 height: 110,
                                  width: 110,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/greeneclipse.png"),
                                        fit: BoxFit.cover),
                                  ),
                                 child: const TextWidget(text: '5',
                                     txtColor: CustomColors.colorWhite,
                                     fontFamily: 'PoppinMedium',
                                     fontSize: 40.0,
                                     textAlign: TextAlign.center),
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(child: TextWidget(text: Customstrings.assignedCourse,
                                    txtColor: CustomColors.colorWhite,
                                    fontFamily: 'PoppinBold',
                                    fontSize: 12.0,
                                    textAlign: TextAlign.center),),
                                Expanded(child:  TextWidget(text: Customstrings.assignedModule,
                                    txtColor: CustomColors.colorWhite,
                                    fontFamily: 'PoppinBold',
                                    fontSize: 12.0,
                                    textAlign: TextAlign.center))

                              ],
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 110,
                                    width: 110,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/yelloweclipse.png"),
                                          fit: BoxFit.cover),
                                    ),
                                    child: const TextWidget(text: '11',
                                        txtColor: CustomColors.colorWhite,
                                        fontFamily: 'PoppinMedium',
                                        fontSize: 40.0,
                                        textAlign: TextAlign.center)

                                ),
                                const SizedBox(width: 80,),
                                Container(
                                  height: 110,
                                  width: 110,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/redeclipse.png"),
                                        fit: BoxFit.cover),
                                  ),
                                  child: const TextWidget(text: '59',
                                      txtColor: CustomColors.colorWhite,
                                      fontFamily: 'PoppinMedium',
                                      fontSize: 40.0,
                                      textAlign: TextAlign.center),
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(child: TextWidget(text: Customstrings.trainingAttempt,
                                    txtColor: CustomColors.colorWhite,
                                    fontFamily: 'PoppinBold',
                                    fontSize: 12.0,
                                    textAlign: TextAlign.center)),
                                Expanded(child:  TextWidget(text: Customstrings.evalutionAttempt,
                                    txtColor: CustomColors.colorWhite,
                                    fontFamily: 'PoppinBold',
                                    fontSize: 12.0,
                                    textAlign: TextAlign.center))

                              ],
                            ),
                            const SizedBox(height: 10,),
                             const Align(
                               alignment: Alignment.topLeft,
                               child:  TextWidget(text: Customstrings.report,
                                   txtColor: CustomColors.colorWhite,
                                   fontFamily: 'PoppinMedium',
                                   fontSize: 18.0,
                                   textAlign: TextAlign.center),
                             ),
                           Container(
                               width: double.infinity,
                               height: 220,
                               margin: const EdgeInsets.only(bottom: 50),
                               child: ListView(
                             // This next line does the trick.

                             shrinkWrap: true,
                             cacheExtent: 10000,
                             scrollDirection: Axis.horizontal,
                             children: <Widget>[

                               Container(
                                 width : 110,
                                 decoration: BoxDecoration(
                                   border: Border.all(width: 1, color: CustomColors.colorWhite),
                                   borderRadius: const BorderRadius.only(topLeft : Radius.circular(5),bottomLeft: Radius.circular(5)),
                                 ),
                                 child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children:  [
                                     const Padding(padding : EdgeInsets.all(5.0),
                                         child :TextWidget(text: Customstrings.course,
                                         txtColor: CustomColors.colorWhite,
                                         fontFamily: 'PoppinRegular',
                                         fontSize: 12.0,
                                         textAlign: TextAlign.center)),
                                   

                                      Container(
                                       color: Colors.white,
                                       height: 1,
                                       width: MediaQuery.of(context).size.width
                                     ),
                                     const Padding(padding : EdgeInsets.all(10.0),
                                         child :TextWidget(text: Customstrings.grtraining,
                                             txtColor: CustomColors.colorWhite,
                                             fontFamily: 'PoppinRegular',
                                             fontSize: 12.0,
                                             textAlign: TextAlign.center)),
                                     Container(
                                         color: Colors.white,
                                         height: 1,
                                         width: MediaQuery.of(context).size.width
                                     ),
                                     const Padding(padding : EdgeInsets.all(10.0),
                                         child :TextWidget(text: Customstrings.grtraining,
                                             txtColor: CustomColors.colorWhite,
                                             fontFamily: 'PoppinRegular',
                                             fontSize: 12.0,
                                             textAlign: TextAlign.center)),
                                     Container(
                                         color: Colors.white,
                                         height: 1,
                                         width: MediaQuery.of(context).size.width
                                     ),
                                     const Padding(padding : EdgeInsets.all(10.0),
                                         child :TextWidget(text: Customstrings.grtraining,
                                             txtColor: CustomColors.colorWhite,
                                             fontFamily: 'PoppinRegular',
                                             fontSize: 12.0,
                                             textAlign: TextAlign.center)),

                                   ],
                                 ) ,
                               ),

                               Container(
                                 padding: const EdgeInsets.all(5.0),
                                 decoration: BoxDecoration(
                                   border: Border.all(width: 1, color: CustomColors.colorWhite),
                                   borderRadius: const BorderRadius.all( Radius.circular(0)),
                                 ),
                                 child: const TextWidget(text: Customstrings.module,
                                     txtColor: CustomColors.colorWhite,
                                     fontFamily: 'PoppinRegular',
                                     fontSize: 12.0,
                                     textAlign: TextAlign.center),
                               ),
                               Container(
                                 padding: const EdgeInsets.all(5.0),
                                 decoration: BoxDecoration(
                                   border: Border.all(width: 1, color: CustomColors.colorWhite),
                                   borderRadius: const BorderRadius.all( Radius.circular(0)),
                                 ),
                                 child: const TextWidget(text: Customstrings.appType,
                                     txtColor: CustomColors.colorWhite,
                                     fontFamily: 'PoppinRegular',
                                     fontSize: 12.0,
                                     textAlign: TextAlign.center),
                               ),
                               Container(
                                 padding: const EdgeInsets.all(5.0),
                                 decoration: BoxDecoration(
                                   border: Border.all(width: 1, color: CustomColors.colorWhite),
                                   borderRadius: const BorderRadius.all( Radius.circular(0)),
                                 ),
                                 child: const TextWidget(text: Customstrings.trainingAttempt,
                                     txtColor: CustomColors.colorWhite,
                                     fontFamily: 'PoppinRegular',
                                     fontSize: 12.0,
                                     textAlign: TextAlign.center),
                               ),
                               Container(
                                 padding: const EdgeInsets.all(5.0),
                                 decoration: BoxDecoration(
                                   border: Border.all(width: 1, color: CustomColors.colorWhite),
                                   borderRadius: const BorderRadius.all( Radius.circular(0)),
                                 ),
                                 child: const TextWidget(text: Customstrings.evalutionAttempt,
                                     txtColor: CustomColors.colorWhite,
                                     fontFamily: 'PoppinRegular',
                                     fontSize: 12.0,
                                     textAlign: TextAlign.center),
                               ),
                               Container(
                                 padding: const EdgeInsets.all(5.0),
                                 decoration: BoxDecoration(
                                   border: Border.all(width: 1, color: CustomColors.colorWhite),
                                   borderRadius: const BorderRadius.all( Radius.circular(0)),
                                 ),
                                 child: const TextWidget(text: Customstrings.lastEvalutionScore,
                                     txtColor: CustomColors.colorWhite,
                                     fontFamily: 'PoppinRegular',
                                     fontSize: 12.0,
                                     textAlign: TextAlign.center),
                               ),
                               Container(
                                 width: 100,

                                 decoration: BoxDecoration(
                                   border: Border.all(width: 1, color: CustomColors.colorWhite),
                                   borderRadius: const BorderRadius.only(topRight : Radius.circular(5),bottomRight: Radius.circular(5)),
                                 ),
                                 child: Column(
                                   children:  [
                                     const
                                     Padding(padding: EdgeInsets.all(5.0),
                                     child :  TextWidget(text: Customstrings.certificate,
                                         txtColor: CustomColors.colorWhite,
                                         fontFamily: 'PoppinRegular',
                                         fontSize: 12.0,
                                         textAlign: TextAlign.center),
                                     ),

                                     Container(
                                         color: Colors.white,
                                         height: 1,
                                         width: MediaQuery.of(context).size.width
                                     ),
                                     
                                     Image.asset('assets/images/downloadicon.png',
                                     height: 60,
                                       width: 50,
                                     ),
                                     Container(
                                         color: Colors.white,
                                         height: 1,
                                         width: MediaQuery.of(context).size.width
                                     ),

                                     Image.asset('assets/images/downloadicon.png',
                                       height: 60,
                                       width: 50,
                                     ),
                                     Container(
                                         color: Colors.white,
                                         height: 1,
                                         width: MediaQuery.of(context).size.width
                                     ),

                                     Image.asset('assets/images/downloadicon.png',
                                       height: 60,
                                       width: 50,
                                     ),

                                   ],
                                 )


                               )

                             ],
                           )),








                          ],
                        )))

            )));
  }

  Widget getCourseList() {
    return ListView.builder(
      shrinkWrap: true,
      cacheExtent: 10000,
      scrollDirection: Axis.horizontal,
      itemCount: 1,
      itemBuilder: (context, position) {
        return Container(
          width: 300,
          padding: EdgeInsets.all(10),
          child: InkWell(
              onTap: () {

              },
              child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [

                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                          borderRadius: const BorderRadius.only(topLeft : Radius.circular(5),bottomLeft: Radius.circular(5)),
                        ),
                        child: const TextWidget(text: Customstrings.course,
                            txtColor: CustomColors.colorWhite,
                            fontFamily: 'PoppinRegular',
                            fontSize: 12.0,
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                          borderRadius: const BorderRadius.all( Radius.circular(0)),
                        ),
                        child: const TextWidget(text: Customstrings.module,
                            txtColor: CustomColors.colorWhite,
                            fontFamily: 'PoppinRegular',
                            fontSize: 12.0,
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                          borderRadius: const BorderRadius.all( Radius.circular(0)),
                        ),
                        child: const TextWidget(text: Customstrings.appType,
                            txtColor: CustomColors.colorWhite,
                            fontFamily: 'PoppinRegular',
                            fontSize: 12.0,
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                          borderRadius: const BorderRadius.all( Radius.circular(0)),
                        ),
                        child: const TextWidget(text: Customstrings.trainingAttempt,
                            txtColor: CustomColors.colorWhite,
                            fontFamily: 'PoppinRegular',
                            fontSize: 12.0,
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                          borderRadius: const BorderRadius.all( Radius.circular(0)),
                        ),
                        child: const TextWidget(text: Customstrings.evalutionAttempt,
                            txtColor: CustomColors.colorWhite,
                            fontFamily: 'PoppinRegular',
                            fontSize: 12.0,
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                          borderRadius: const BorderRadius.all( Radius.circular(0)),
                        ),
                        child: const TextWidget(text: Customstrings.lastEvalutionScore,
                            txtColor: CustomColors.colorWhite,
                            fontFamily: 'PoppinRegular',
                            fontSize: 12.0,
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: CustomColors.colorWhite),
                          borderRadius: const BorderRadius.only(topRight : Radius.circular(5),bottomRight: Radius.circular(5)),
                        ),
                        child: const TextWidget(text: Customstrings.certificate,
                            txtColor: CustomColors.colorWhite,
                            fontFamily: 'PoppinRegular',
                            fontSize: 12.0,
                            textAlign: TextAlign.center),
                      )

                    ],
                  ))),
        );
      },
    );
  }


}
