import 'package:flutter/material.dart';
import 'package:flutter_application_2/Agents/AgentsScreen.dart';
import 'package:flutter_application_2/GuideScreen.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List mapList = [];
  Map? responseData;
  @override
  void initState() {
    super.initState();
    getAgentApi();
  }

  Future getAgentApi() async {
    http.Response response =
        await http.get(Uri.parse("https://valorant-api.com/v1/maps"));
    responseData = jsonDecode(response.body);
    setState(() {
      mapList = responseData?["data"];
    });
  }

  _UtilitesMain utilitesMain = _UtilitesMain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GuidePage(),
                ));
          },
          icon: Icon(Icons.arrow_back, color: utilitesMain.redShadeColor),
        ),
        centerTitle: true,
        title: Text(
          utilitesMain.titleWeapon,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: utilitesMain.fontFontSize),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder(
                future: getAgentApi(),
                builder: (context, snapshot) {
                  if (mapList.isNotEmpty) {
                    // * RETURN GRIDVIEW
                    return GridView.builder(
                        itemCount: mapList.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return Card(
                            elevation: 0,
                            color: Colors.transparent,
                            shape: Border.all(
                                width: 2, color: utilitesMain.redShadeColor),
                            child: Stack(children: [
                              Expanded(
                                child: Padding(
                                  padding: utilitesMain.padNormal,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 0,
                                            color: Colors.transparent)),
                                    child: Padding(
                                      padding: utilitesMain.padNormal,
                                      child: imagePicker(
                                          index, utilitesMain.apiImage),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: utilitesMain.padText,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: textPicker(
                                      context,
                                      utilitesMain,
                                      utilitesMain.apiName,
                                      Colors.red.shade400,
                                      index,
                                      35),
                                ),
                              )
                            ]),
                          );
                        },
                        // * GRID PROPERTIES
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 217,
                        ));
                  } else {
                    // *  RETURN SHIMMER WIDGET
                    return ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return AgentsShimmer(
                            height: utilitesMain.shimmerHeight,
                            width: utilitesMain.shimmerWidth,
                          );
                        });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // * TEXT METHOD FOR API LIST
  Text textPicker(BuildContext context, _UtilitesMain utilitesMain, String name,
      Color color, int array, double fontSize) {
    return Text(
      textAlign: TextAlign.center,
      mapList[array][name].toString().toUpperCase(),
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: fontSize,
          shadows: const [
            Shadow(
                // bottomLeft
                offset: Offset(-1.5, -1.5),
                color: Colors.white),
            Shadow(
                // bottomRight
                offset: Offset(1.5, -1.5),
                color: Colors.white),
            Shadow(
                // topRight
                offset: Offset(1.5, 1.5),
                color: Colors.white),
            Shadow(
                // topLeft
                offset: Offset(-1.5, 1.5),
                color: Colors.white),
          ]),
    );
  }

// * IMAGE METHOD FOR API LIST
  Image imagePicker(int index, String name) {
    return Image(image: NetworkImage(mapList[index][name].toString()));
  }
}

class _UtilitesMain {
  final String titleWeapon = "WEAPON DETAILS";
  final Border borderCard = Border.all(width: 1.3, color: Colors.red.shade400);
  final Color redShadeColor = Colors.red.shade400;
  final Color whiteOpaColor = Colors.white.withOpacity(0.6);
  final EdgeInsets padNormal = const EdgeInsets.all(8);
  final EdgeInsets marginImage = const EdgeInsets.all(10);
  final EdgeInsets padText = const EdgeInsets.only(top: 8, left: 8, right: 8);
  final double fontFontSize = 25;
  final String apiName = "displayName";
  final String apiImage = "splash";
  final double shimmerHeight = 200;
  final double shimmerWidth = 164;
}
