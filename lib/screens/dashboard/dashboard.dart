import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:daa/common/common.dart';
import 'package:daa/common/custom_strings.dart';
import 'package:daa/screens/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';

import '../../common/api_services.dart';
import '../../models/sub_modules_model.dart';
import '../module_detail.dart';

var courseVisible = true,
    subCourseVisible = false,
    authToken = "",
 tabTitle = Customstrings.courses;
StreamController<bool> streamController = StreamController<bool>();
StreamController<bool> streamController1 = StreamController<bool>();
class Dashboard extends StatefulWidget {
  final Stream<bool>stream;
  final StreamController<bool> srController;
  const Dashboard(this.srController,this.stream, {super.key});

  @override
  DashState createState() => DashState();
}

class DashState extends State<Dashboard> {
  var pageIndex = 0;
  var checkForBack = false;

  final pages = [
     HomeWork(streamController1.stream),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamController = widget.srController;
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

       setState((){
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
            child:  WillPopScope(
        onWillPop: () async {
          if (checkForBack) {

            setState(() {
              checkForBack = false;
              streamController1.add(true);

            });
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
                ),
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
                                  AssetImage("assets/images/homeworkicon.png"),
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
                            ]))))
            )
        ));
  }
}

class HomeWork extends StatefulWidget {
  final Stream<bool>stream;
  const HomeWork(this.stream, {super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeWork> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var baseUrl = "";
  List<Data>? moduleList;
  DashboardViewModel dashboardViewModel = DashboardViewModel();

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
    dashboardViewModel.fetchModuleData(context, authToken).then((value){
      if (value.status.toString() == "true") {
        setState(() {
          baseUrl = value.baseUrl.toString();
          moduleList = value.data;
          courseVisible = false;
          subCourseVisible = true;
          tabTitle = Customstrings.grtraining;
          streamController.add(true);
        });
      }else {
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
                     child : Flexible(
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
                                                color: Colors.black
                                                    .withOpacity(.30),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            color:
                                                Colors.black.withOpacity(.30),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            color:
                                                Colors.black.withOpacity(.30),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            color:
                                                Colors.black.withOpacity(.30),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            color:
                                                Colors.black.withOpacity(.30),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            color:
                                                Colors.black.withOpacity(.30),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            color:
                                                Colors.black.withOpacity(.30),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            color:
                                                Colors.black.withOpacity(.30),
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
                  )
                    ),
                  Visibility(
                      visible: subCourseVisible,
                      child : Flexible(
                        child: getList(),
                      )
                  ),

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
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
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
