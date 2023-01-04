import 'dart:convert';
import 'dart:io';
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
                        itemCount: agents.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: Border.all(
                                width: 1.3,
                                color: const Color.fromARGB(255, 246, 68, 83)),
                            child: Container(
                              child: Column(children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  agents[index].displayName.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Image(
                                    image: NetworkImage(
                                        agents[10].fullPortraitV2.toString()))
                              ]),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 320,
                          crossAxisSpacing: 10,
                        ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
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

/**
Future<ValoModel> getAgentApi() async {
    final response =
        await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return ValoModel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }


  List<Agent> agents = [];

  Future getAgent() async {
    var response =
        await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
    var jsonData = jsonDecode(response.body);

    for (var eachAgent in jsonData["data"]) {
      final agent = Agent(
        displayIconSmall: eachAgent["displayIconSmall"],
        description: eachAgent["description"],
        displayName: eachAgent["displayName"],
      );
      agents.add(agent);
    }
  }
 Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(50, 0, 0, 0),
                                  border: Border.all(
                                      width: 1.3,
                                      color: const Color.fromARGB(
                                          255, 246, 68, 83))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      agents[index].displayName.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NBA'),
        ),
        body: FutureBuilder(
          future: getAgent(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  borderOnForeground: true,
                  color: Colors.red[500],
                  child: ListView.builder(
                    itemCount: agents.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        minVerticalPadding: 10,
                        minLeadingWidth: 5,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            agents[index].displayName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        leading: Image.network(agents[index].displayIconSmall),
                        subtitle: Text(
                          agents[index].description,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
   */
