import 'package:flutter/material.dart';
import 'package:flutter_application_2/AgentsScreen.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'VALORANT GUIDE',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 85),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AgentScreen(),
                        ));
                  },
                  child: GuideCard(
                    utilitie: agents,
                  ),
                ),
                GuideCard(
                  utilitie: weapon,
                ),
                GuideCard(
                  utilitie: map,
                ),
                GuideCard(
                  utilitie: sprays,
                ),
              ],
            ),
          ),
        ));
  }
}

class GuideCard extends StatefulWidget {
  const GuideCard({
    super.key,
    required this.utilitie,
  });
  final Utilities utilitie;

  @override
  State<GuideCard> createState() => _GuideCardState();
}

class _GuideCardState extends State<GuideCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(50, 0, 0, 0),
          border: Border.all(color: Colors.red.shade400, width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 185,
        width: 375,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 25),
              child: Text(
                textAlign: TextAlign.left,
                widget.utilitie.title.toString(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 35),
            Container(
              height: 180,
              width: 150,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(widget.utilitie.imageUrl.toString()))),
            ),
          ],
        ),
      ),
    );
  }
}

class Utilities {
  String? title;
  String? imageUrl;

  Utilities(
    String this.title,
    String this.imageUrl,
  );
}

var agents = Utilities(
  "AGENTS    ",
  "https://mog-cdn.fra1.digitaloceanspaces.com/avatar/60559d27bb2c5e6512074569-1616483383487.png",
);

var weapon = Utilities(
  "WEAPONS",
  "https://vgraphs.com/images/players/sprays/high-quality/valorant-spray-no-op.png",
);

var map = Utilities(
  "MAPS        ",
  "https://static.wikia.nocookie.net/valorant/images/c/c9/Camper_Spray.png/revision/latest/scale-to-width-down/250?cb=20200806062601",
);

var sprays = Utilities(
  "SPRAYS     ",
  "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt4bf1bade4f10ff9c/5f8a7c8a1f5f6d4173b50c6e/notime.png",
);
