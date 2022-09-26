
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daa/models/sub_modules_model.dart';
import 'package:daa/screens/module_detail.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../common/api_services.dart';
import '../common/common.dart';
import '../common/custom_strings.dart';

class Subcourses extends StatefulWidget {
  var title = "";
  Subcourses(this.title);

  @override
  SubCourseState createState() => SubCourseState();
}

class SubCourseState extends State<Subcourses> {
  var AuthToken = "", imageUrl = "",percent = 0,checkForDownload = false;
  List<Data>? moduleList;

  @override
  void initState() {
    super.initState();
    checkForPref();
  }

  checkForPref() async {
    String token = await Common.getPreferences("token");
    AuthToken = token;
    callModulesApi();
  }

  callModulesApi() {
    Common.showLoaderDialog(context);
    final service = ApiServices();
    service.getModules(AuthToken).then((value) {
      Navigator.pop(context);
      print("status is = ${value.status}");
      if (value.status.toString() == "true") {
        setState(() {
          imageUrl = value.baseUrl.toString();
          moduleList = value.data;
        });
      } else {
        Common.showToast("something went wrong", "red");
      }
    });
  }

  downloadDialog(String title,int position) {
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
                    title,
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

                            if (moduleList![position]
                                .mobilevr
                                .toString()
                                .isNotEmpty &&
                                moduleList![position].mobilevr != null) {

                              checkForDownload = true;
                                var dir =
                                await DownloadsPathProvider.downloadsDirectory;
                                if (dir != null) {
                                  String savename = moduleList![position]
                                      .mobilevr.toString();
                                  String savePath = "${dir.path}/$savename";
                                  print(savePath);
                                  //output:  /storage/emulated/0/Download/banner.png

                                  try {
                                    await Dio().download(
                                        "$imageUrl/${moduleList![position]
                                            .mobilevr}",
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
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Common.colorAccent,
            child: Container(
                color: Common.colorAccent,
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  getList()

                ])),
          ),
        ));
  }

  Widget getList() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemCount: moduleList?.length ?? 0,
        itemBuilder: (context, position) {
          return Container(
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: ()  {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => ModuleDetail(moduleList![position].content.toString(),
                              moduleList![position].title.toString(),moduleList![position].mobilevr.toString(),moduleList![position].ar.toString(),imageUrl)));
                     /* if(moduleList![position].mobilevr.toString().isNotEmpty && moduleList![position].mobilevr != null) {
                        checkForDownload = false;
                        downloadDialog(
                            moduleList![position].mobilevr.toString(),
                            position);
                      }*/
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
                              imageUrl: "$imageUrl/${moduleList![position].image}",
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          /*  Image.network(
                              "$imageUrl/${moduleList![position].image}",
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
                  )));
        },
      ),
    );
  }
}
