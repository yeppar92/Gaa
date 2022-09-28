import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daa/common/common.dart';
import 'package:daa/common/custom_strings.dart';
import 'package:daa/models/all_courses_model.dart';
import 'package:daa/screens/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ login/login.dart';
import '../../common/api_services.dart';
import '../../models/sub_modules_model.dart';
import '../../widgets/text_widget.dart';
import '../module_detail.dart';

var courseVisible = true,
    subCourseVisible = false,
    authToken = "",
    tabTitle = Customstrings.courses,
    singInTitle = Customstrings.signin;
StreamController<bool> streamController = StreamController<bool>();
StreamController<bool> streamController1 = StreamController<bool>();
DashboardViewModel dashboardViewModel = DashboardViewModel();

class Dashboard extends StatefulWidget {
  final Stream<bool> stream;
  final StreamController<bool> srController;
  var title = "";
  Dashboard(this.srController, this.stream, this.title, {super.key});

  @override
  DashState createState() => DashState();
}

class DashState extends State<Dashboard> {
  var pageIndex = 0;
  var checkForBack = false;

  final pages = [
    WithoutSign()
    //HomeWork(streamController1.stream),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamController = widget.srController;
    singInTitle = widget.title;
    widget.stream.listen((event) {
      checkBack(event);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkForPref();
    });
  }

  checkForPref() async {
    String token = await Common.getPreferences("token");
    authToken = token;
  }

  void checkBack(bool checkBack) {
    setState(() {
      checkForBack = checkBack;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final textTheme = Theme.of(context).textTheme;
    return Container(
        color: Common.colorAccent,
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
                    extendBody: true,
                    /*  appBar: AppBar(
                      backgroundColor: Common.colorAccent,
                      leading: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            //Navigator.of(context).pop();
                            if (checkForBack) {
                              setState(() {
                                checkForBack = false;
                                streamController1.add(true);
                              });
                            }
                          }),
                      actions: <Widget>[
                        IconButton(
                          icon: Image.asset(
                            "assets/images/proicon.png",
                            width: 30,
                            height: 30,
                          ),
                          onPressed: () {
                            // do something
                          },
                        )
                      ],
                      title: Image.asset(
                        'assets/images/splashlogo.png',
                        height: 50,
                        width: 50,
                      ),
                      centerTitle: true,
                    ),*/
                    body: pages[pageIndex],
                    bottomNavigationBar: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Common.tfbackColor.withOpacity(.40),
                                spreadRadius: 0,
                                blurRadius: 10),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            child: BottomNavigationBar(
                                type: BottomNavigationBarType.fixed,
                                currentIndex: pageIndex,
                                backgroundColor: Colors.white.withOpacity(.80),
                                selectedItemColor: Common.colorAccent,
                                unselectedItemColor: Common.txtColor,
                                selectedLabelStyle: textTheme.caption,
                                unselectedLabelStyle: textTheme.caption,
                                onTap: (value) {
                                  setState(() {
                                    //pageIndex = value;
                                    pageIndex = 0;
                                  });
                                },
                                items: const [
                                  BottomNavigationBarItem(
                                    label: Customstrings.courses,
                                    icon: ImageIcon(
                                      AssetImage(
                                          "assets/images/homeworkicon.png"),
                                    ),
                                  ),
                                  BottomNavigationBarItem(
                                    label: Customstrings.dashboard,
                                    icon: ImageIcon(
                                      AssetImage("assets/images/dashicon.png"),
                                    ),
                                  ),
                                  BottomNavigationBarItem(
                                    label: Customstrings.profile,
                                    icon: ImageIcon(
                                      AssetImage("assets/images/usericon.png"),
                                    ),
                                  ),
                                ]))))));
  }
}

class HomeWork extends StatefulWidget {
  final Stream<bool> stream;
  const HomeWork(this.stream, {super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeWork> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var baseUrl = "";
  List<Data>? moduleList;

  @override
  void initState() {
    super.initState();
    widget.stream.listen((event) {
      checkVisible();
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void checkVisible() {
    setState(() {
      courseVisible = true;
      subCourseVisible = false;
      tabTitle = Customstrings.courses;
    });
  }

  callModulesApi() {
    dashboardViewModel.fetchModuleData(context, authToken).then((value) {
      if (value.status.toString() == "true") {
        setState(() {
          baseUrl = value.baseUrl.toString();
          moduleList = value.data;
          courseVisible = false;
          subCourseVisible = true;
          tabTitle = Customstrings.grtraining;
          streamController.add(true);
        });
      } else {
        Common.showToast("something went wrong", "red");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 0,
          centerTitle: true,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Common.colorAccent,
          elevation: 0.0,
          bottom: TabBar(
            controller: _tabController,
            labelPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            tabs: [
              Tab(
                text: tabTitle,
              ),
              const Tab(
                text: Customstrings.dashboard,
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
                color: Common.colorAccent,
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Visibility(
                      visible: courseVisible,
                      child: Flexible(
                        child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5),
                            children: [
                              InkWell(
                                  onTap: () {
                                    callModulesApi();
                                    /* Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => Subcourses(Customstrings.grtraining)));*/
                                  },
                                  child: SizedBox(
                                    height: 120,
                                    width: double.infinity,
                                    child: Card(
                                        color: Colors.white,
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 5,
                                        child: Stack(children: [
                                          Image.asset(
                                            'assets/images/rectone.png',
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              alignment: Alignment.center,
                                              color:
                                                  Colors.black.withOpacity(.30),
                                              height: 30,
                                              width: double.infinity,
                                              child: Text(
                                                Customstrings.grtraining,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ])),
                                  )),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Card(
                                    color: Colors.white,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/recttwo.png',
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.black.withOpacity(.30),
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            Customstrings.comingsoon,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Card(
                                    color: Colors.white,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/rectthree.png',
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.black.withOpacity(.30),
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            Customstrings.comingsoon,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Card(
                                    color: Colors.white,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/rectfour.png',
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.black.withOpacity(.30),
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            Customstrings.comingsoon,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Card(
                                    color: Colors.white,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/rectfive.png',
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.black.withOpacity(.30),
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            Customstrings.comingsoon,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Card(
                                    color: Colors.white,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/rectsix.png',
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.black.withOpacity(.30),
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            Customstrings.comingsoon,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Card(
                                    color: Colors.white,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/recttwo.png',
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.black.withOpacity(.30),
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            Customstrings.comingsoon,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Card(
                                    color: Colors.white,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/recttwo.png',
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.black.withOpacity(.30),
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            Customstrings.comingsoon,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                            ]),
                      )),
                  Visibility(
                      visible: subCourseVisible,
                      child: Flexible(
                        child: getList(),
                      )),
                ])),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(children: const []))
            /* Icon(Icons.directions_car),
              Icon(Icons.directions_transit),*/
          ],
        ));
  }

  Widget getList() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemCount: moduleList?.length ?? 0,
        itemBuilder: (context, position) {
          return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ModuleDetail(
                          moduleList![position].content.toString(),
                          moduleList![position].title.toString(),
                          moduleList![position].mobilevr.toString(),
                          moduleList![position].ar.toString(),
                          baseUrl)));
                },
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Card(
                      color: Colors.white,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Stack(children: [
                        CachedNetworkImage(
                          imageUrl: "$baseUrl/${moduleList![position].image}",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),

                        /*  Image.network(
                          "$baseUrl/${moduleList![position].image}",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),*/
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.black.withOpacity(.30),
                            height: 30,
                            width: double.infinity,
                            child: Text(
                              moduleList![position].title.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ])),
                ),
              ));
        },
      ),
    );
  }
}

class WithoutSign extends StatefulWidget {
  WithoutSign({super.key});

  @override
  WithoutSignState createState() => WithoutSignState();
}

class WithoutSignState extends State<WithoutSign> {
  List<CourseData>? courseList;
  List<Data>? moduleList;
  List<String> imageList = [
    'assets/images/rectone.png',
    'assets/images/recttwo.png',
    'assets/images/rectthree.png',
    'assets/images/rectfour.png',
    'assets/images/rectfive.png',
    'assets/images/rectsix.png',
    'assets/images/subrectone.png',
    'assets/images/rectone.png',
    'assets/images/recttwo.png',
    'assets/images/rectthree.png',
  ];
  var baseUrl = "",userName = "";

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
    String token = await Common.getPreferences("token");
    String name = await Common.getPreferences("username");
    userName = name;
    callCoursesApi();
  }

  callCoursesApi() {
    dashboardViewModel.fetchAllCoursesData(context).then((value) {
      if (value.status.toString() == "true") {
        setState(() {
          courseList = value.courseData;
          baseUrl = value.baseUrl.toString();
        });
      } else {
        Common.showToast("something went wrong", "red");
      }
    });
  }

  callModulesApi() {
    dashboardViewModel.fetchModuleData(context, authToken).then((value) {
      if (value.status.toString() == "true") {
        setState(() {
          baseUrl = value.baseUrl.toString();
          moduleList = value.data;
          courseVisible = false;
          subCourseVisible = true;
          singInTitle = "";
        });
      } else {
        Common.showToast("something went wrong", "red");
      }
    });
  }

  showLogoutDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const TextWidget(
          text: Customstrings.no,
          txtColor: Common.txtColor,
          fontFamily: "PoppinMedium",
          fontSize: 14.0,
          textAlign: TextAlign.left),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const TextWidget(
          text: Customstrings.yes,
          txtColor: Common.txtColor,
          fontFamily: "PoppinMedium",
          fontSize: 14.0,
          textAlign: TextAlign.left),
      onPressed:  () {
        setState(() {
          singInTitle = Customstrings.signin;
          Common.SetPreferences("login", "false");
          Navigator.of(context).pop();
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const TextWidget(
          text: Customstrings.logout,
          txtColor: Common.txtColor,
          fontFamily: "PoppinBold",
          fontSize: 16.0,
          textAlign: TextAlign.left),
      content:  const TextWidget(
          text: Customstrings.logouttitle,
          txtColor: Common.txtColor,
          fontFamily: "PoppinLight",
          fontSize: 14.0,
          textAlign: TextAlign.left),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Common.colorAccent,
          statusBarIconBrightness: Brightness.light,
        ),
        child:  WillPopScope(
            onWillPop: () async {
              if (subCourseVisible) {
                courseVisible = true;
                subCourseVisible = false;
                singInTitle = userName;
              } else {
                SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');

              }
              return false;
            },
            child : Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: Common.colorAccent,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      if (subCourseVisible) {
                        courseVisible = true;
                        subCourseVisible = false;
                        singInTitle = userName;
                      } else {
                        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
                      }
                    });
                  }),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    if (singInTitle == Customstrings.signin) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const Login1()));
                    } else {
                      showLogoutDialog(context);
                    }
                  },
                  child: Text(
                    singInTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoppinMedium',
                        fontSize: 18.0),
                  ),
                ),
              ],
              title: Image.asset(
                'assets/images/splashlogo.png',
                height: 50,
                width: 50,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Visibility(
                    visible: courseVisible,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CarouselSlider(
                          items: [
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/subrectone.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/recttwo.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],

                          //Slider Container properties
                          options: CarouselOptions(
                            height: 200.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: const [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: TextWidget(
                                        text: Customstrings.companyName,
                                        txtColor: Common.txtColor,
                                        fontFamily: "PoppinBold",
                                        fontSize: 24.0,
                                        textAlign: TextAlign.left)),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: TextWidget(
                                      text:
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      txtColor: Common.txtColor,
                                      fontFamily: "PoppinRegular",
                                      fontSize: 16.0,
                                      textAlign: TextAlign.left),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: TextWidget(
                                      text: 'Our Courses : ',
                                      txtColor: Common.txtColor,
                                      fontFamily: "PoppinBold",
                                      fontSize: 20.0,
                                      textAlign: TextAlign.left),
                                ),
                              ],
                            )),
                        SizedBox(
                            height: 280,
                            width: double.infinity,
                            child: getCourseList())
                      ],
                    )),
                Visibility(
                    visible: subCourseVisible,
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: getModuleList())),
              ],
            )))));
  }

  Widget getCourseList() {
    return ListView.builder(
      shrinkWrap: true,
      cacheExtent: 10000,
      scrollDirection: Axis.horizontal,
      itemCount: courseList?.length ?? 0,
      itemBuilder: (context, position) {
        return Container(
          width: 300,
          padding: EdgeInsets.all(10),
          child: InkWell(
              onTap: () {
                print(singInTitle);
                if (singInTitle != Customstrings.signin) {
                  callModulesApi();
                } else {
                  Common.showToast(
                      'You have to log in.Please login first', 'red');
                }
              },
              child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                          child: Card(
                              color: Colors.white,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              child: Stack(children: [
                                Container(
                                  child: Image.asset(
                                    imageList[position],
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                  /* CachedNetworkImage(
                                    imageUrl: "https://picsum.photos/250?image=9",

                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  )*/
                                )

                                /* CachedNetworkImage(
                                  imageUrl: "$baseUrl/${courseList![position].image}",

                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                )*/
                                ,
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.black.withOpacity(.30),
                                    height: 30,
                                    width: double.infinity,
                                    child: Text(
                                      courseList![position].title.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ]))),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          alignment: Alignment.topLeft,
                          child: TextWidget(
                              text: courseList![position].title.toString(),
                              txtColor: Common.txtColor,
                              fontFamily: "PoppinBold",
                              fontSize: 14.0,
                              textAlign: TextAlign.left)),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: TextWidget(
                            text: courseList![position]
                                .description
                                .toString()
                                .substring(0, 100),
                            txtColor: Common.txtColor,
                            fontFamily: "PoppinRegular",
                            fontSize: 10.0,
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ))),
        );
      },
    );
  }

  Widget getModuleList() {
    return GridView.builder(
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
      itemCount: moduleList?.length ?? 0,
      itemBuilder: (context, position) {
        return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ModuleDetail(
                        moduleList![position].content.toString(),
                        moduleList![position].title.toString(),
                        moduleList![position].mobilevr.toString(),
                        moduleList![position].ar.toString(),
                        baseUrl)));
              },
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Card(
                    color: Colors.white,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Stack(children: [
                      CachedNetworkImage(
                        imageUrl: "$baseUrl/${moduleList![position].image}",
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),

                      /*  Image.network(
                          "$baseUrl/${moduleList![position].image}",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),*/
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(.30),
                          height: 30,
                          width: double.infinity,
                          child: Text(
                            moduleList![position].title.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ])),
              ),
            ));
      },
    );
  }
}
