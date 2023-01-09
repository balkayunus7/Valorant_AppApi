import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter_application_2/Weapons/WeaponScreen.dart';

import '../Agents/AgentDetailScreen.dart';

class WeaponDetail extends StatefulWidget {
  WeaponDetail(
      {required this.displayName,
      required this.displayIcon,
      required this.category,
      required this.fireRate,
      required this.magazineSize,
      required this.runSpeedMultiplier,
      required this.equipTimeSeconds,
      required this.reloadTimeSeconds,
      required this.firstBulletAccuracy,
      super.key});
  String displayName;
  String displayIcon;
  String category;
  String fireRate;
  String magazineSize;
  String runSpeedMultiplier;
  String equipTimeSeconds;
  String reloadTimeSeconds;
  String firstBulletAccuracy;

  @override
  State<WeaponDetail> createState() => _WeaponDetailState();
}

class _WeaponDetailState extends State<WeaponDetail> {
  _UtilitesMain utilitesMain = _UtilitesMain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * APP BAR WITH ICON BUTTON AND MATERAL PAGE ROUTER
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WeaponScreen(),
                ));
          },
          icon: Icon(Icons.arrow_back, color: utilitesMain.textRedShadeColor),
        ),
        centerTitle: true,
        title: TextWithDynamicTheme(
          text: widget.displayName.toUpperCase(),
          fontSize: utilitesMain.fontSizeBig,
          fontWeight: FontWeight.bold,
          color: utilitesMain.textWhiteColor,
        ),
      ),
      // * BODY
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * AGENT IMAGE AND BACKGROUND WITH SHADOW
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: dropShadow(),
                ),
              ],
            ),
            // * REUSABLE ROW FOR AGENT DETAİLS
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: utilitesMain.cardColor,
                child: Column(children: [
                  // * REUSABLE ROW FOR DETAİLS
                  ReusableRow(
                    title: utilitesMain.textName,
                    description: widget.displayName,
                  ),
                  // * DESCRIPTION WEAPONS
                  ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: TextWithDynamicTheme(
                          text: utilitesMain.textDesc,
                          fontSize: utilitesMain.fontSizeBig,
                          color: utilitesMain.textRedShadeColor,
                        ),
                      ),
                      subtitle: TextWithDynamicTheme(
                        text: widget.category,
                        fontSize: utilitesMain.fontSizeBig,
                        color: utilitesMain.textWhiteColor,
                      )),
                  Divider(
                    color: utilitesMain.textDividColor,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: TextWithDynamicTheme(
                        text: "STATS",
                        color: utilitesMain.textRedShadeColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // * WEAPON STATS WITH REUSABLE ROWS
                  _ReusableRow(
                    color: utilitesMain.textWhiteColor,
                    title: utilitesMain.textFirerate,
                    description: widget.fireRate,
                  ),
                  _ReusableRow(
                    color: utilitesMain.textWhiteColor,
                    title: utilitesMain.equipTimeSeconds,
                    description: widget.equipTimeSeconds,
                  ),
                  _ReusableRow(
                    color: utilitesMain.textWhiteColor,
                    title: utilitesMain.firstBulletAccuracy,
                    description: widget.firstBulletAccuracy,
                  ),
                  _ReusableRow(
                    color: utilitesMain.textWhiteColor,
                    title: utilitesMain.magazineSize,
                    description: widget.magazineSize,
                  ),
                  _ReusableRow(
                    color: utilitesMain.textWhiteColor,
                    title: utilitesMain.reloadTimeSeconds,
                    description: widget.reloadTimeSeconds,
                  ),
                  _ReusableRow(
                    color: utilitesMain.textWhiteColor,
                    title: utilitesMain.reloadTimeSeconds,
                    description: widget.runSpeedMultiplier,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // * DROPSHADOW FOR AGENT IMAGE WITH BLUR
  DropShadowImage dropShadow() {
    return DropShadowImage(
      blurRadius: 1.5,
      scale: 1,
      borderRadius: 10,
      image: Image(
        height: 300,
        fit: BoxFit.fitWidth,
        image: NetworkImage(widget.displayIcon),
      ),
    );
  }
}

// * UTILITES FOR MAIN WIDGET
class _UtilitesMain {
  final String textName = "NAME :";
  final String textDesc = "DESCRIPTION :";
  final String textFirerate = "Fire Rate:";
  final String equipTimeSeconds = "Equip Time Seconds :";
  final String firstBulletAccuracy = "First Bullet Accuracy :";
  final String magazineSize = "Magazine Size :";
  final String runSpeedMultiplier = "RunSpeed Multiplier :";
  final String reloadTimeSeconds = "Reload TimeSeconds :";
  final Color textRedShadeColor = Colors.red.shade400;
  final Color textWhiteColor = Colors.white;
  final Color textDividColor = Colors.white;
  final Color cardColor = const Color.fromARGB(255, 19, 31, 45);
  final double fontSizeBig = 20;
}

// * Utilites for Extract Widget
// * Reusable Row
class _UtilitesRow {
  final Color textWhite = Colors.white;
  final Color textDivid = Colors.white;
  final Color textRedShade = Colors.red.shade400;
  final double fontSize = 20;
  final EdgeInsets padReuasRow =
      const EdgeInsets.only(left: 14, right: 10, top: 10, bottom: 5);
}

// * REUSABLE ROW WIDGET
class _ReusableRow extends StatelessWidget with _UtilitesRow {
  _ReusableRow(
      {super.key,
      required this.title,
      required this.description,
      required this.color});

  final String title, description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _UtilitesRow().padReuasRow,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // * TITLE AND DESCRIPTION
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: _UtilitesRow().fontSize, color: color),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: _UtilitesRow().fontSize,
                    color: _UtilitesRow().textWhite),
              ),
            ],
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
