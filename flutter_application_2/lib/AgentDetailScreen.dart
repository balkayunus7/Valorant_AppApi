import 'package:flutter/material.dart';
import 'package:flutter_application_2/AgentsScreen.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter_application_2/GuideScreen.dart';

class AgentDetail extends StatefulWidget {
  AgentDetail(
      {super.key,
      required this.fullPortraitV2,
      required this.displayName,
      required this.background});
  String fullPortraitV2;

  String displayName;
  String background;

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
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                alignment: Alignment.center,
                image: NetworkImage(widget.background),
                color: Colors.white.withOpacity(0.5),
              ),
              DropShadowImage(
                blurRadius: 12,
                scale: 1,
                borderRadius: 60,
                image: Image(
                  height: 500,
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(widget.fullPortraitV2),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
