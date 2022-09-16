import 'dart:convert';

import 'package:daa/common/Common.dart';
import 'package:daa/common/Customstrings.dart';
import 'package:daa/screens/Subcourses.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashState createState() => DashState();
}

class DashState extends State<Dashboard>  {

  var pageIndex = 0;
  final pages = [
    const HomeWork(),
    const HomeWork(),
    const HomeWork(),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkForPref();
  }



  checkForPref() async {}

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
              appBar: AppBar(
                backgroundColor: Common.colorAccent,
                /* leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),*/
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
                title: Image.asset('assets/images/splashlogo.png',
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
                                pageIndex = value;
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
                                label:Customstrings.profile,
                                icon: ImageIcon(
                                  AssetImage("assets/images/usericon.png"),
                                ),
                              ),

                            ])))
            )));
  }
}

class HomeWork extends StatefulWidget {
  const HomeWork({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeWork>  with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
            tabs: const [
              Tab(
                text: Customstrings.courses,
              ),
              Tab(
                text: Customstrings.dashboard,
              ),
            ],
          ),
      ),
        extendBodyBehindAppBar: true,
        body:  TabBarView(
          controller: _tabController,
          children: [
            Container(
                color: Common.colorAccent,
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Expanded(
                      child: GridView(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5),
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => Subcourses(Customstrings.grtraining)));
                                },
                                child : SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child:  Card(
                                      color: Colors.white,
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      elevation: 5,
                                      child: Stack(
                                          children: [
                                            Image.asset(
                                              'assets/images/rectone.png',
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child:  Container(
                                                alignment: Alignment.center,
                                                color: Colors.black.withOpacity(.30),
                                                height: 30,
                                                width: double.infinity,
                                                child: Text(Customstrings.grtraining,style: const TextStyle(color: Colors.white),),
                                              ),
                                            )

                                          ]


                                      )),
                                )),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child:  Card(
                                  color: Colors.white,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/recttwo.png',
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child:  Container(
                                            alignment: Alignment.center,
                                            color: Colors.black.withOpacity(.30),
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: Text(Customstrings.comingsoon,style: const TextStyle(color: Colors.white),),
                                          ),
                                        )

                                      ]


                                  )),
                            ),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child:  Card(
                                  color: Colors.white,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/rectthree.png',
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child:  Container(
                                            alignment: Alignment.center,
                                            color: Colors.black.withOpacity(.30),
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: Text(Customstrings.comingsoon,style: const TextStyle(color: Colors.white),),
                                          ),
                                        )

                                      ]


                                  )),
                            ),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child:  Card(
                                  color: Colors.white,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/rectfour.png',
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child:  Container(
                                            alignment: Alignment.center,
                                            color: Colors.black.withOpacity(.30),
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: Text(Customstrings.comingsoon,style: const TextStyle(color: Colors.white),),
                                          ),
                                        )

                                      ]


                                  )),
                            ),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child:  Card(
                                  color: Colors.white,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/rectfive.png',
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child:  Container(
                                            alignment: Alignment.center,
                                            color: Colors.black.withOpacity(.30),
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: Text(Customstrings.comingsoon,style: const TextStyle(color: Colors.white),),
                                          ),
                                        )

                                      ]


                                  )),
                            ),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child:  Card(
                                  color: Colors.white,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/rectsix.png',
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child:  Container(
                                            alignment: Alignment.center,
                                            color: Colors.black.withOpacity(.30),
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: Text(Customstrings.comingsoon,style: const TextStyle(color: Colors.white),),
                                          ),
                                        )

                                      ]


                                  )),
                            ),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child:  Card(
                                  color: Colors.white,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/recttwo.png',
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child:  Container(
                                            alignment: Alignment.center,
                                            color: Colors.black.withOpacity(.30),
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: Text(Customstrings.comingsoon,style: const TextStyle(color: Colors.white),),
                                          ),
                                        )

                                      ]


                                  )),
                            ),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child:  Card(
                                  color: Colors.white,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/recttwo.png',
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child:  Container(
                                            alignment: Alignment.center,
                                            color: Colors.black.withOpacity(.30),
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: Text(Customstrings.comingsoon,style: const TextStyle(color: Colors.white),),
                                          ),
                                        )

                                      ]


                                  )),
                            ),



                          ]))
                ])),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(children: const []))
            /* Icon(Icons.directions_car),
              Icon(Icons.directions_transit),*/
          ],
        ),);
  }
}
