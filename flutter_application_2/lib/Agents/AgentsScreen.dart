import 'dart:convert';
import 'dart:core';
import 'package:flutter_application_2/Agents/AgentDetailScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_application_2/GuideScreen.dart';
import 'package:flutter_application_2/Models/AgentModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgentScreen extends StatefulWidget {
  const AgentScreen({Key? key}) : super(key: key);

  @override
  _AgentScreenState createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen>
    with TickerProviderStateMixin {
  List agentsList = [];
  Map? responseData;

  @override
  void initState() {
    super.initState();
    getAgentApi;
  }

  Future getAgentApi() async {
    http.Response response = await http.get(Uri.parse(UtilitesCard().api));
    responseData = jsonDecode(response.body);
    setState(() {
      agentsList = responseData?["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    UtilitesCard utilitesCard = UtilitesCard();
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
          icon: Icon(Icons.arrow_back, color: utilitesCard.cardColorRed),
        ),
        centerTitle: true,
        title: Text(
          utilitesCard.titleAgent,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: utilitesCard.titleFontsSize),
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
                  if (agentsList.isNotEmpty) {
                    // * RETURN GRIDVIEW
                    return GridView.builder(
                        itemCount: agentsList.length,
                        itemBuilder: (context, index) {
                          if (agentsList[index][utilitesCard.apiPlayable]) {
                            return InkWell(
                              onTap: () {
                                // * AGENT ROUTER PUSH
                                Navigator.push(context, pageRout(index));
                              },
                              // * CARD WIDGET FOR GRIDVIEW WIDGET
                              child: Card(
                                elevation: 0,
                                color: Colors.transparent,
                                shape: Border.all(
                                    width: 1.3,
                                    color: utilitesCard.cardColorRed),
                                child: Column(children: [
                                  textPicker(context, utilitesCard,
                                      utilitesCard.apiName, index),
                                  Expanded(
                                    child: imagePicker(
                                        index, utilitesCard.apiImage),
                                  )
                                ]),
                              ),
                            );
                          } else {
                            // * CARD WIDGET FOR GRIDVIEW WIDGET
                            return Card(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: utilitesCard.borderCard,
                              child: Column(children: [
                                textPicker(context, utilitesCard,
                                    utilitesCard.apiName, 8),
                                Expanded(
                                  child: imagePicker(8, utilitesCard.apiImage),
                                )
                              ]),
                            );
                          }
                        },
                        // * GRID PROPERTIES
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 320,
                          crossAxisSpacing: 10,
                        ));
                  } else {
                    // *  RETURN SHIMMER WIDGET
                    return ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return AgentsShimmer();
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
  Text textPicker(
      BuildContext context, UtilitesCard utilitesCard, String name, int array) {
    return Text(
      textAlign: TextAlign.center,
      agentsList[array][name].toString(),
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: utilitesCard.cardColorRed,
          ),
    );
  }

  Image imagePicker(int index, String name) {
    return Image(
        fit: BoxFit.fitHeight,
        image: NetworkImage(agentsList[index][name].toString()));
  }

  // * Material Page for Agent Details Screen
  MaterialPageRoute<dynamic> pageRout(int index) {
    return MaterialPageRoute(
      builder: (context) => AgentDetail(
          ability1Desc:
              agentsList[index]["abilities"][0]["description"].toString(),
          ability1Icon: agentsList[index]["abilities"][0]["displayIcon"],
          ability1Name:
              agentsList[index]["abilities"][0]["displayName"].toString(),
          ability2Desc:
              agentsList[index]["abilities"][1]["description"].toString(),
          ability2Icon:
              agentsList[index]["abilities"][1]["displayIcon"].toString(),
          ability2Name:
              agentsList[index]["abilities"][1]["displayName"].toString(),
          ability3Desc:
              agentsList[index]["abilities"][2]["description"].toString(),
          ability3Icon:
              agentsList[index]["abilities"][2]["displayIcon"].toString(),
          ability3Name:
              agentsList[index]["abilities"][2]["displayName"].toString(),
          ability4Desc:
              agentsList[index]["abilities"][3]["description"].toString(),
          ability4Icon:
              agentsList[index]["abilities"][3]["displayIcon"].toString(),
          ability4Name:
              agentsList[index]["abilities"][3]["displayName"].toString(),
          description: agentsList[index]["description"],
          background: agentsList[index]["background"],
          fullPortraitV2: agentsList[index]["fullPortraitV2"],
          roleName: agentsList[index]["role"]["displayName"],
          developerName: agentsList[index]["developerName"],
          displayName: agentsList[index]["displayName"]),
    );
  }
}

// ignore: must_be_immutable
class AgentsShimmer extends StatelessWidget with UtilitesShimmer {
  AgentsShimmer({
    super.key,
  });
  UtilitesShimmer utilitesShimmer = UtilitesShimmer();
  @override
  Widget build(BuildContext context) {
    var container = Container(
      color: utilitesShimmer.contColor,
      height: utilitesShimmer.height,
      width: utilitesShimmer.width,
    );
    return Shimmer.fromColors(
      baseColor: utilitesShimmer.baseColor,
      highlightColor: utilitesShimmer.highlightColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: utilitesShimmer.paddingAll,
                child: container,
              ),
              Padding(
                padding: utilitesShimmer.paddingAll,
                child: container,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class UtilitesShimmer {
  final Color baseColor = Colors.grey.shade700;
  final Color highlightColor = Colors.grey.shade300;
  final Color contColor = Colors.black26;
  final double height = 320;
  final double width = 164;
  final EdgeInsets paddingAll = const EdgeInsets.all(8.0);
}

class UtilitesCard {
  final Color cardColorRed = const Color.fromARGB(255, 246, 68, 83);
  final Border borderCard = Border.all(width: 1.3, color: Colors.red.shade400);
  final String apiName = "displayName";
  final String apiImage = "fullPortraitV2";
  final String apiPlayable = "isPlayableCharacter";
  final String titleAgent = 'AGENTS';
  final String api = "https://valorant-api.com/v1/agents";
  final double titleFontsSize = 25;
}
