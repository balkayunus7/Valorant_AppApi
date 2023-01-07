import 'dart:convert';
import 'dart:core';
import 'package:flutter_application_2/AgentDetailScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_application_2/GuideScreen.dart';
import 'package:flutter_application_2/ValoModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgentScreen extends StatefulWidget {
  const AgentScreen({Key? key}) : super(key: key);

  @override
  _AgentScreenState createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  List agentsList = [];
  Map? responseData;

  @override
  void initState() {
    super.initState();
    getAgentApi;
  }

  Future getAgentApi() async {
    http.Response response =
        await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
    responseData = jsonDecode(response.body);
    setState(() {
      agentsList = responseData?["data"];
    });
  }

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
          icon: const Icon(Icons.arrow_back, color: Colors.red),
        ),
        centerTitle: true,
        title: Text(
          'AGENTS',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),
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
                    return GridView.builder(
                        itemCount: agentsList.length,
                        itemBuilder: (context, index) {
                          if (agentsList[index]["isPlayableCharacter"]) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AgentDetail(
                                          abilityDesc: agentsList[index]["abilities"]
                                                  [1]["description"]
                                              .toString(),
                                          abilityIcon: agentsList[index]
                                              ["abilities"][1]["displayIcon"],
                                          abilityName: agentsList[index]["abilities"]
                                                  [1]["displayName"]
                                              .toString(),
                                          description: agentsList[index]
                                              ["description"],
                                          background: agentsList[index]
                                              ["background"],
                                          fullPortraitV2: agentsList[index]
                                              ["fullPortraitV2"],
                                          roleName: agentsList[index]["role"]
                                              ["displayName"],
                                          developerName: agentsList[index]["developerName"],
                                          displayName: agentsList[index]["displayName"]),
                                    ));
                              },
                              child: Card(
                                elevation: 0,
                                color: Colors.transparent,
                                shape: Border.all(
                                    width: 1.3,
                                    color:
                                        const Color.fromARGB(255, 246, 68, 83)),
                                child: Column(children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    agentsList[index]["displayName"].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 246, 68, 83),
                                        ),
                                  ),
                                  Expanded(
                                    child: Image(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(agentsList[index]
                                                ["fullPortraitV2"]
                                            .toString())),
                                  )
                                ]),
                              ),
                            );
                          } else {
                            return Card(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: Border.all(
                                  width: 1.3,
                                  color:
                                      const Color.fromARGB(255, 246, 68, 83)),
                              child: Column(children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  agentsList[8]["displayName"].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 246, 68, 83),
                                      ),
                                ),
                                Expanded(
                                  child: Image(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(agentsList[8]
                                              ["fullPortraitV2"]
                                          .toString())),
                                )
                              ]),
                            );
                          }
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 320,
                          crossAxisSpacing: 10,
                        ));
                  } else {
                    return ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return const AgentsShimmer();
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
}

class AgentsShimmer extends StatelessWidget {
  const AgentsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade300,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black26,
                  height: 320,
                  width: 164,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black26,
                  height: 320,
                  width: 164,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
