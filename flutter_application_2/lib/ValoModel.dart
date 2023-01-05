import 'package:flutter/material.dart';

class Agent {
  final String displayName;
  final String description;
  final bool isPlayableCharacter;
  var background;
  var fullPortraitV2;
  final String displayIconSmall;
  Agent({
    required this.background,
    required this.isPlayableCharacter,
    required this.fullPortraitV2,
    required this.displayIconSmall,
    required this.description,
    required this.displayName,
  });
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