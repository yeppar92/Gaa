import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../common/common.dart';
import '../../../common/custom_colors.dart';
import '../../../common/custom_strings.dart';
import '../../../models/report_model.dart';
import '../../../widgets/rounded_button.dart';
import '../../../widgets/text_field_widget.dart';
import '../../../widgets/text_widget.dart';
import 'mainscreen_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  var cardColor1 = CustomColors.cardColor1.withOpacity(.90);
  var cardColor2 = CustomColors.cardColor2.withOpacity(.90);
  var cardColor3 = CustomColors.cardColor3.withOpacity(.90);
  var sideBarVisible = true;
  var leftMargin = 0.0,topMargin = 170.0;
  var visibleCount = 0,miliSeconds = 0,listLength = 0;
  MainScreenViewModel mainScreenViewModel = MainScreenViewModel();
  var assignedCourses = "0",assignedModules = "0",trainingAttempts = "",evalutaionAttempts = "0";
  List<Coursereports>? reportList;
  @override
  void initState() {
    super.initState();
    checkForPref();
  }

  @override
  void dispose() {
    super.dispose();
    mainScreenViewModel.dispose();
  }

  checkForPref() async {
    String token = await Common.getPreferences("token");
   callReportApi(token);

   }

   callReportApi(String authToken){
     mainScreenViewModel.fetchDashReportData(context, authToken).then((value) {
       if (value.status.toString() == "true") {
         setState(() {
          assignedCourses = value.courses.toString();
          assignedModules = value.modules.toString();
          trainingAttempts = value.trainingAttempts.toString();
          reportList = value.coursereports;
          listLength = reportList?.length ?? 0;
         });
       } else {
         Common.showToast("something went wrong", "red");
       }
     });
   }

  List<Widget> _buildCells(int count) {
    print("count is = $count");
    print("check is = $count");
    return List.generate(
      count, (index) =>
        Column(
          children: [

            if (index == 0) ...[
              returnContainer(-1,Customstrings.courses,110.0)
            ]
            else if (index == 1) ...[
              returnContainer(-1,Customstrings.module,110.0)
            ]
            else if (index == 2) ...[
                returnContainer(-1,Customstrings.appType,150.0)
              ]
              else if (index == 3) ...[
                  returnContainer(-1,Customstrings.trainingAttempt,150.0)
                ]
                else if (index == 4) ...[
                    returnContainer(-1,Customstrings.evalutionAttempt,150.0)
                  ]
                  else if (index == 5) ...[
                      returnContainer(-1,Customstrings.lastEvalutionScore,150.0)
                    ]
                    else  ...[
                        returnContainer(-1,Customstrings.certificate,110.0)
                      ]


          ],
        ),

    );
  }


  Container returnContainer(int srvalue,String headerValue,double widthValue){
   /* if(srvalue != -1)
      headerValue = '$srvalue';*/
    return Container(
      alignment: Alignment.center,
      width: widthValue,
      height: 50.0,
      color: CustomColors.colorWhite,
      margin: const EdgeInsets.all(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (headerValue != 'certificate') ...[
        TextWidget(text: headerValue,
        txtColor: CustomColors.blackColor,
        fontFamily: 'PoppinRegular',
        fontSize: 12.0,
        textAlign: TextAlign.center)
        ]
       else ...[

         Image.asset('assets/images/downloadicon.png',
              color: CustomColors.blackColor,
            )
       ]



        ],
      )





    );
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
                    child : Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 60),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
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
                                        child:  TextWidget(text: assignedCourses,
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
                                      child:  TextWidget(text: assignedModules,
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
                                        child:  TextWidget(text: trainingAttempts,
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
                                      child:  TextWidget(text: evalutaionAttempts,
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

                                SizedBox(
                                  width : MediaQuery.of(context).size.height,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children : [
                                          Container(
                                            color: Colors.black26,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: _buildCells(7),
                                            ),
                                          ),
                                          Container(
                                              color: Colors.black26,
                                              child : Column(
                                                  children: [
                                                    for(var i = 0; i < listLength; i++) ...[
                                                      Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              children: [

                                                                returnContainer(i+1,reportList![i].feedbackType.toString(),110.0),
                                                                returnContainer(-1,reportList![i].moduleId.toString(),110.0),
                                                                returnContainer(-1,reportList![i].type.toString(),150.0),
                                                                returnContainer(-1,reportList![i].trainingAttempts.toString(),150.0),
                                                                returnContainer(-1,reportList![i].evaluationAttempts.toString(),150.0),
                                                                returnContainer(-1,reportList![i].lastScore.toString(),150.0),
                                                                returnContainer(-1,'certificate',110.0)

                                                              ],
                                                            ),
                                                          ]
                                                      ),
                                                    ]
                                                  ]
                                              )
                                          )
                                        ]
                                    ),
                                  ),
                                ),

                               /* Container(
                                   height:500,
                                    width: double.infinity,
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
                                    )),*/








                              ],
                            )),
                        Align(alignment: Alignment.centerLeft,
                        child:
                        Card(
                            color: Colors.transparent,
                          semanticContainer: true,
                          clipBehavior:
                          Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10.0),
                          ),
                          elevation: 0.0,
                          child:
                          Stack(
                            children: <Widget>[
                              AnimatedOpacity(
                                  opacity: sideBarVisible ? 0 : 1 ,
                                  curve: Curves.easeInOut,
                                  duration:  Duration(milliseconds: miliSeconds),
                              child : Container(
                                height: 350,
                                width: 165,
                                padding: EdgeInsets.all(10),
                                decoration:  BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [cardColor1,cardColor2,cardColor3])),
                                child:

                                Column(

                                  children:  [
                                    const TextWidget(text: Customstrings.dashboard,
                                        txtColor: CustomColors.colorHeader,
                                        fontFamily: 'PoppinMeduim',
                                        fontSize: 20.0,
                                        textAlign: TextAlign.center),

                                    const SizedBox(height: 30,),

                                    RoundedButton(
                                        onPressed: ()  {

                                        },
                                        textColor: CustomColors.colorWhite,
                                        btnColor: CustomColors.blackColor,
                                        rippleColor:
                                        CustomColors.cardColor2.withOpacity(.20),
                                        borderColor: Common.colorAccent,
                                        text: Customstrings.purchaseCourse,
                                        height: 50.0,
                                        width: 150.0,
                                        fontSize: 13,
                                        circularSize: 30.0),

                                    const SizedBox(height: 20,),

                                    RoundedButton(
                                        onPressed: ()  {

                                        },
                                        textColor: CustomColors.colorWhite,
                                        btnColor: CustomColors.blackColor,
                                        rippleColor:
                                        CustomColors.cardColor2.withOpacity(.20),
                                        borderColor: Common.colorAccent,
                                        text: Customstrings.raiseTicket,
                                        height: 50.0,
                                        width: 150.0,
                                        fontSize: 13,
                                        circularSize: 30.0),

                                    const SizedBox(height: 20,),

                                    RoundedButton(
                                        onPressed: ()  {

                                        },
                                        textColor: CustomColors.colorWhite,
                                        btnColor: CustomColors.blackColor,
                                        rippleColor:
                                        CustomColors.cardColor2.withOpacity(.20),
                                        borderColor: Common.colorAccent,
                                        text: Customstrings.ticketStatus,
                                        height: 50.0,
                                        width: 150.0,
                                        fontSize: 13,
                                        circularSize: 30.0),

                                    const SizedBox(height: 20,),

                                    RoundedButton(
                                        onPressed: ()  {

                                        },
                                        textColor: CustomColors.colorWhite,
                                        btnColor: CustomColors.blackColor,
                                        rippleColor:
                                        CustomColors.cardColor2.withOpacity(.20),
                                        borderColor: Common.colorAccent,
                                        text: Customstrings.support,
                                        height: 50.0,
                                        width: 150.0,
                                        fontSize: 13,
                                        circularSize: 30.0)
                                  ],
                                ),

                              )),
                              Container(
                                margin: EdgeInsets.only(left: leftMargin,top: topMargin),
                                child: IconButton(
                                  icon: Image.asset('assets/images/roundrightarrow.png',
                                  height: 30,
                                    width: 30,
                                    color: CustomColors.colorWhite,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      visibleCount++;
                                      if(visibleCount == 1){
                                        miliSeconds = 1000;
                                        sideBarVisible = false;
                                        leftMargin = 160.0;
                                        topMargin = 170.0;
                                      }else{
                                        miliSeconds = 0;
                                        sideBarVisible = true;
                                        leftMargin = 0.0;
                                        topMargin = 170.0;
                                        visibleCount = 0;
                                      }



                                    });
                                  },
                                ),
                              ),
                            ],
                          )


                        )

                        )

                      ],
                    ),


                  )

            )));
  }

  Widget getCourseList() {
    var titleVisible = true;
    return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
        child: Column(
        mainAxisSize: MainAxisSize.max,
          children: [
            ListView.builder(
              shrinkWrap: true,
              cacheExtent: 10000,
              itemCount: reportList?.length ?? 0,
              itemBuilder: (context, position) {
                if(position == 0){
                  titleVisible = true;
                }else{
                  titleVisible = false;
                }

                return Container(
                  width: 950,
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                      onTap: () {

                      },
                      child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              Visibility(
                                  visible: titleVisible,
                                  child : Row(
                                    children: [
                                      Container(
                                        width: 110,
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
                                        width: 110,
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
                                        width: 150,
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
                                        width: 150,
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
                                        width: 150,
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
                                        width: 150,
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
                                        width: 110,
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
                                  )),

                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 110,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: CustomColors.colorWhite),
                                      borderRadius: const BorderRadius.only(topLeft : Radius.circular(5),bottomLeft: Radius.circular(5)),
                                    ),
                                    child:  TextWidget(text: reportList![position].type.toString(),
                                        txtColor: CustomColors.colorWhite,
                                        fontFamily: 'PoppinRegular',
                                        fontSize: 12.0,
                                        textAlign: TextAlign.center),
                                  ),

                                  Container(
                                    width: 110,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: CustomColors.colorWhite),
                                      borderRadius: const BorderRadius.all( Radius.circular(0)),
                                    ),
                                    child:  TextWidget(text: reportList![position].moduleId.toString(),
                                        txtColor: CustomColors.colorWhite,
                                        fontFamily: 'PoppinRegular',
                                        fontSize: 12.0,
                                        textAlign: TextAlign.center),
                                  ),
                                  Container(
                                    width: 150,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: CustomColors.colorWhite),
                                      borderRadius: const BorderRadius.all( Radius.circular(0)),
                                    ),
                                    child:  TextWidget(text:reportList![position].feedbackType.toString(),
                                        txtColor: CustomColors.colorWhite,
                                        fontFamily: 'PoppinRegular',
                                        fontSize: 12.0,
                                        textAlign: TextAlign.center),
                                  ),

                                  Container(
                                    width: 150,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: CustomColors.colorWhite),
                                      borderRadius: const BorderRadius.all( Radius.circular(0)),
                                    ),
                                    child:  TextWidget(text:reportList![position].trainingAttempts.toString(),
                                        txtColor: CustomColors.colorWhite,
                                        fontFamily: 'PoppinRegular',
                                        fontSize: 12.0,
                                        textAlign: TextAlign.center),
                                  ),

                                  Container(
                                    width: 150,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: CustomColors.colorWhite),
                                      borderRadius: const BorderRadius.all( Radius.circular(0)),
                                    ),
                                    child:  TextWidget(text: reportList![position].evaluationAttempts.toString(),
                                        txtColor: CustomColors.colorWhite,
                                        fontFamily: 'PoppinRegular',
                                        fontSize: 12.0,
                                        textAlign: TextAlign.center),
                                  ),

                                  Container(
                                    width: 150,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: CustomColors.colorWhite),
                                      borderRadius: const BorderRadius.all( Radius.circular(0)),
                                    ),
                                    child:  TextWidget(text: reportList![position].lastScore.toString(),
                                        txtColor: CustomColors.colorWhite,
                                        fontFamily: 'PoppinRegular',
                                        fontSize: 12.0,
                                        textAlign: TextAlign.center),
                                  ),

                                  Container(
                                    width: 110,
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
                              )


                            ],
                          ))),
                );
              },
            )
            ]
   ));
  }


}
