
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daa/common/Customstrings.dart';
import 'package:daa/screens/Forgotpass.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';


import '../common/ApiServices.dart';
import '../common/Common.dart';
import 'Dashboard.dart';

class ModuleDetail extends StatefulWidget {
  var title = "";
  ModuleDetail(this.title);

  @override
  ModuleState createState() => ModuleState();
}

class ModuleState extends State<ModuleDetail> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Common.colorAccent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Common.colorAccent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(widget.title),
            centerTitle: true,
          ),
          body:  ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child:   CarouselSlider(
                  items: [
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage("https://picsum.photos/250?image=9"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage("https://picsum.photos/250?image=9"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage("https://picsum.photos/250?image=9"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),



                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child:  const Text(
                  "Marshalling is one-on-one visual communication and a part of aircraft ground handling. It may be as an alternative to, or additional to, radio communications between the aircraft and air traffic control. The usual equipment of a marshaller is a reflecting safety vest, a helmet with acoustic earmuffs, and gloves or marshalling wands–handheld illuminated beacons.In this module the users will learn marshalling signals in an interactive and immersive simulation, in this user-friendly simulation the user will train for marshalling in training mode and the users will also have access to evaluation mode where they can test their skills and receive reports based on their performance.After completing this module, the user will be able to perform marshalling signals.",
                  style: TextStyle(
                      color: Common.txtColor,
                      fontFamily: 'PoppinRegular'),
                ),
              )

            ],
          ),
          bottomNavigationBar: Container(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white, width: .5),
                          borderRadius:
                          BorderRadius.circular(0.0),
                          color: Common.colorAccent,
                          shape: BoxShape.rectangle,
                        ),
                        child: TextButton.icon(
                          // <-- TextButton
                          onPressed: () {

                          },
                          icon: const Icon(
                            Icons.supervised_user_circle,
                            color: Colors.white,
                          ),
                          label: const Text(Customstrings.desktopVr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PoppinMedium',
                                 )),
                        ))),
                Expanded(
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white, width: .5),
                          borderRadius:
                          BorderRadius.circular(0.0),
                          color: Common.colorAccent,
                          shape: BoxShape.rectangle,
                        ),
                        child: TextButton.icon(
                          // <-- TextButton
                          onPressed: () {

                          },
                          icon: const Icon(
                            Icons.send_to_mobile_outlined,
                            color: Colors.white,
                          ),
                          label: const Text(Customstrings.mobileAr,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PoppinMedium',
                              )),
                        )))
              ],
            ),
          ),
        )
    );
  }
}
