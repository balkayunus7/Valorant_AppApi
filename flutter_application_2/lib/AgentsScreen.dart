import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:core';
import 'package:shimmer/shimmer.dart';
import 'dart:math';
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
  List<Agent> agents = [];

  Future getAgentApi() async {
    final response =
        await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
    var jsonData = jsonDecode(response.body);

    for (var eachAgent in jsonData["data"]) {
      final agent = Agent(
        isPlayableCharacter: eachAgent["isPlayableCharacter"],
        fullPortraitV2: eachAgent["fullPortraitV2"],
        displayIconSmall: eachAgent["displayIconSmall"],
        description: eachAgent["description"],
        displayName: eachAgent["displayName"],
      );
      agents.add(agent);
    }
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
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GridView.builder(
                        itemCount: 21,
                        itemBuilder: (context, index) {
                          if (agents[index].isPlayableCharacter) {
                            return Card(
                              shape: Border.all(
                                  width: 1.3,
                                  color:
                                      const Color.fromARGB(255, 246, 68, 83)),
                              child: Column(children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  agents[index].displayName.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Image(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(agents[index]
                                          .fullPortraitV2
                                          .toString())),
                                )
                              ]),
                            );
                          } else {
                            return Card(
                              shape: Border.all(
                                  width: 1.3,
                                  color:
                                      const Color.fromARGB(255, 246, 68, 83)),
                              child: Column(children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  agents[index].displayName.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Image(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                          agents[8].fullPortraitV2.toString())),
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
