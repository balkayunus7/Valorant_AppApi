import 'package:flutter/material.dart';
import 'package:flutter_application_2/AgentsScreen.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter_application_2/GuideScreen.dart';

class AgentDetail extends StatefulWidget {
  AgentDetail({
    super.key,
    required this.description,
    required this.abilityName,
    required this.abilityIcon,
    required this.abilityDesc,
    required this.roleName,
    required this.background,
    required this.displayName,
    required this.developerName,
    required this.fullPortraitV2,
  });

  String displayName;
  String abilityIcon;
  String roleName;
  String background;
  String developerName;
  String fullPortraitV2;
  String description;
  String abilityDesc;
  String abilityName;
  @override
  State<AgentDetail> createState() => _AgentDetailState();
}

class _AgentDetailState extends State<AgentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AgentScreen(),
                ));
          },
          icon: const Icon(Icons.arrow_back, color: Colors.red),
        ),
        centerTitle: true,
        title: Text(
          widget.displayName.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * AGENT IMAGE AND BACKGROUND WİTH SHADOW
            Stack(
              children: [
                Image(
                  alignment: Alignment.center,
                  image: NetworkImage(widget.background),
                  color: Colors.white.withOpacity(0.5),
                ),
                DropShadowImage(
                  blurRadius: 1.5,
                  scale: 1,
                  borderRadius: 10,
                  image: Image(
                    height: 500,
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(widget.fullPortraitV2),
                  ),
                ),
              ],
            ),
            // * REUSABLE ROW FOR AGENT DETAİLS
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: const Color.fromARGB(255, 19, 31, 45),
                child: Column(children: [
                  // * REUSABLE ROW FOR DETAİLS
                  ReusableRow(
                    title: "NAME : ",
                    description: widget.displayName,
                  ),
                  ReusableRow(
                    title: "ORIGIN : ",
                    description: widget.developerName,
                  ),
                  ReusableRow(
                    title: "ROLE : ",
                    description: widget.roleName,
                  ),
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "DESCRİPTİON : ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 20, color: Colors.red.shade400),
                      ),
                    ),
                    subtitle: Text(
                      widget.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(height: 40),

                  // * ABILITIES CONTAINERS
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ABILITES",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 27, color: Colors.red.shade400),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(50, 0, 0, 0),
                          border: Border.all(
                              color: Colors.red.shade400, width: 1.4),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 404,
                        width: 375,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.abilityName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontSize: 35,
                                              color: Colors.red.shade400),
                                    )),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image: NetworkImage(widget.abilityIcon),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      children: const [
                                        Text("Type: DAMAGE"),
                                        Text("Cost: 3000"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  widget.abilityDesc,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// * REUSABLE ROW WİDGET
class ReusableRow extends StatelessWidget {
  const ReusableRow(
      {super.key, required this.title, required this.description});

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20, color: Colors.red.shade400),
              ),
              Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
