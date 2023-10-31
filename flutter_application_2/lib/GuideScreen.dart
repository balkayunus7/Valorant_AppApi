import 'package:flutter/material.dart';
import 'package:flutter_application_2/Agents/AgentDetailScreen.dart';
import 'package:flutter_application_2/Agents/AgentsScreen.dart';
import 'package:flutter_application_2/Maps/MapScreen.dart';
import 'package:flutter_application_2/Weapons/WeaponScreen.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> with _UtilitesGuide {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: TextWithDynamicTheme(
            text: _UtilitesGuide().title,
            fontSize: _UtilitesGuide().textSize,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 85,
            ),
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WeaponScreen(),
                        ));
                  },
                  child: GuideCard(
                    utilitie: weapon,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ));
                  },
                  child: GuideCard(
                    utilitie: map,
                  ),
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

class GuideCard extends StatefulWidget with _UtilitesGuide {
  GuideCard({
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
    _UtilitesGuide utilitesGuide = _UtilitesGuide();
    return Padding(
      padding: utilitesGuide.contPadding,
      child: Container(
        decoration: BoxDecoration(
          color: utilitesGuide.contColor,
          border: utilitesGuide.contBorder,
          borderRadius: utilitesGuide.borderRadius,
        ),
        height: 185,
        width: 375,
        child: Row(
          children: [
            Padding(
                padding: utilitesGuide.textPadding,
                child: TextWithDynamicTheme(
                  text: widget.utilitie.title.toString(),
                  textAlign: utilitesGuide.textAlign,
                  color: utilitesGuide.textColor,
                  fontSize: utilitesGuide.textSize,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(width: 35),
            Container(
              height: utilitesGuide.height,
              width: utilitesGuide.width,
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

class _UtilitesGuide {
  final TextAlign textAlign = TextAlign.left;
  final Color textColor = Colors.white;
  final Color contColor = const Color.fromARGB(50, 0, 0, 0);
  final BorderRadius borderRadius = BorderRadius.circular(8);
  final double textSize = 30;
  final double height = 180;
  final double width = 130;
  final String title = 'VALORANT GUIDE';
  final EdgeInsets textPadding = const EdgeInsets.only(top: 15, left: 25);
  final EdgeInsets contPadding = const EdgeInsets.all(8.0);
  final Border contBorder = Border.all(color: Colors.red.shade400, width: 3);
}

// * Utilites for GuideScreen
class Utilities {
  String? title;
  String? imageUrl;

  Utilities(
    String this.title,
    String this.imageUrl,
  );
}

// * Objects for  for GuideScreen
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
