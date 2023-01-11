import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Agents/AgentsScreen.dart';
import 'package:flutter_application_2/GuideScreen.dart';
import 'package:flutter_application_2/Weapons/WeaponDetailScreen.dart';
import 'package:http/http.dart' as http;

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({super.key});

  @override
  State<WeaponScreen> createState() => _WeaponScreenState();
}

class _WeaponScreenState extends State<WeaponScreen> {
  List weaponList = [];
  List nameList = [];
  Map? responseData;
  @override
  void initState() {
    super.initState();
    getAgentApi();
  }

  Future getAgentApi() async {
    http.Response response =
        await http.get(Uri.parse("https://valorant-api.com/v1/weapons"));
    responseData = jsonDecode(response.body);
    setState(() {
      weaponList = responseData?["data"];
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
                  if (weaponList.isNotEmpty) {
                    // * RETURN GRIDVIEW
                    return GridView.builder(
                        itemCount: weaponList.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return InkWell(
                            onTap: () {
                              // * AGENT ROUTER PUSH
                              Navigator.push(
                                  context,
                                  _pageRout(
                                    index,
                                  ));
                            },
                            // * CARD WIDGET FOR GRIDVIEW WIDGET
                            child: Card(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: Border.all(
                                  width: 2, color: utilitesMain.redShadeColor),
                              child: Column(children: [
                                Padding(
                                  padding: utilitesMain.padText,
                                  child: textPicker(
                                      context,
                                      utilitesMain,
                                      utilitesMain.apiName,
                                      utilitesMain.whiteOpaColor,
                                      index),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: utilitesMain.padNormal,
                                    child: Container(
                                      margin: utilitesMain.marginImage,
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
                                )
                              ]),
                            ),
                          );
                        },
                        // * GRID PROPERTIES
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 220,
                          crossAxisSpacing: 10,
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

// * Text Method for api List
  Text textPicker(BuildContext context, _UtilitesMain utilitesMain, String name,
      Color color, int array) {
    return Text(
      textAlign: TextAlign.center,
      weaponList[array][name].toString(),
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.bold, color: color),
    );
  }

  Image imagePicker(int index, String name) {
    return Image(
        color: utilitesMain.whiteOpaColor,
        fit: BoxFit.fitWidth,
        image: NetworkImage(weaponList[index][name].toString()));
  }

  // * Material Page for Agent Details Screen
  MaterialPageRoute<dynamic> _pageRout(
    int index,
  ) {
    List name = [];
    for (var i = 0; i < weaponList.length; i++) {
      name.add(weaponList[index]["skins"][i]["chromas"][0]["displayName"]
          .toString());
    }
    List image = [];
    for (var i = 0; i < weaponList.length; i++) {
      image.add(
          weaponList[index]["skins"][i]["chromas"][0]["fullRender"].toString());
    }
    return MaterialPageRoute(
      builder: (context) => WeaponDetail(
        weaponChromoImage: image,
        weaponChromoName: name,
        equipTimeSeconds:
            weaponList[index]["weaponStats"]["equipTimeSeconds"].toString(),
        fireRate: weaponList[index]["weaponStats"]["fireRate"].toString(),
        firstBulletAccuracy:
            weaponList[index]["weaponStats"]["firstBulletAccuracy"].toString(),
        magazineSize:
            weaponList[index]["weaponStats"]["magazineSize"].toString(),
        reloadTimeSeconds:
            weaponList[index]["weaponStats"]["reloadTimeSeconds"].toString(),
        runSpeedMultiplier:
            weaponList[index]["weaponStats"]["runSpeedMultiplier"].toString(),
        category: weaponList[index]["category"],
        displayIcon: weaponList[index]["displayIcon"],
        displayName: weaponList[index]["displayName"],
      ),
    );
  }
}

// * UTILITES FOR MAIN WIDGET
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
  final String apiImage = "displayIcon";
  final double shimmerHeight = 200;
  final double shimmerWidth = 164;
}
