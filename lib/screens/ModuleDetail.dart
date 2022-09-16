
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daa/common/Customstrings.dart';
import 'package:daa/screens/Forgotpass.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';


import '../common/ApiServices.dart';
import '../common/Common.dart';
import 'Dashboard.dart';

class ModuleDetail extends StatefulWidget {
  var content = "",title = "",mobileVr = "",mobileAr = "",baseUrl = "";
  ModuleDetail(this.content,this.title,this.mobileVr,this.mobileAr,this.baseUrl);

  @override
  ModuleState createState() => ModuleState();
}

class ModuleState extends State<ModuleDetail> {
  var percent = 0,checkForDownload = false;

  @override
  void initState() {
    super.initState();

  }

  downloadDialog(String apkName) {
    percent = 0;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  contentPadding: EdgeInsets.only(top: 10.0),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children:  <Widget>[
                          Text(
                            Customstrings.download_file,
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Common.colorAccent),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Text(
                          apkName,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Common.colorAccent),
                        ),
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),

                      CircularPercentIndicator(
                        radius: 80.0,
                        lineWidth: 10.0,
                        percent: percent/100,
                        center: Text(
                          "$percent%",
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        backgroundColor: Common.list_divider,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Common.colorAccent,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      InkWell(
                        child: Container(
                            decoration: const BoxDecoration(
                              color: Common.colorAccent,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                var status1 = await Permission.manageExternalStorage.status;
                                if(!status1.isGranted){
                                  await Permission.manageExternalStorage.request();
                                }
                                if(!checkForDownload && status1.isGranted) {

                                  if (apkName
                                      .isNotEmpty &&
                                     apkName != null) {

                                    checkForDownload = true;
                                    var dir =
                                    await DownloadsPathProvider.downloadsDirectory;
                                    if (dir != null) {
                                      String savename = apkName;
                                      String savePath = "${dir.path}/$savename";
                                      print(savePath);
                                      //output:  /storage/emulated/0/Download/banner.png

                                      try {
                                        await Dio().download(
                                            "${widget.baseUrl}/$apkName",
                                            savePath,
                                            onReceiveProgress: (received, total) {
                                              if (total != -1) {
                                                print("${(received / total * 100)
                                                    .toStringAsFixed(0)}%");
                                                var percentValue = (received /
                                                    total * 100)
                                                    .toStringAsFixed(0);

                                                setState(() {
                                                  percent = int.parse(percentValue);
                                                  print(
                                                      "percentvalue is == $percent");
                                                });
                                                //you can build progressbar feature too
                                              }
                                            });


                                        OpenFile.open(savePath);
                                        print("File is saved to download folder.");
                                        Navigator.of(context).pop();
                                      } on DioError catch (e) {
                                        print(e.message);
                                      }
                                    }

                                  }
                                }
                              },
                              child: const Text(
                                'Download',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                );
              });
        });
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
                child:   Text(
                 widget.content,
                  style: const TextStyle(
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
                            if(widget.mobileVr.isNotEmpty && widget.mobileVr != "null") {
                              checkForDownload = false;
                              downloadDialog(widget.mobileVr);
                            }else{
                              Common.showToast("Mobile VR is not avaialble.", "red");
                            }
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
                            if(widget.mobileVr.isNotEmpty && widget.mobileAr != "null") {
                              checkForDownload = false;
                              downloadDialog(widget.mobileAr);
                            }else{
                              Common.showToast("Mobile AR is not avaialble.", "red");
                            }
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
