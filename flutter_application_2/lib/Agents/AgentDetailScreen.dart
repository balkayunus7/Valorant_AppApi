import 'package:flutter/material.dart';
import 'package:flutter_application_2/Agents/AgentsScreen.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

class AgentDetail extends StatefulWidget {
  AgentDetail({
    super.key,
    required this.description,
    required this.ability1Name,
    required this.ability1Icon,
    required this.ability1Desc,
    required this.roleName,
    required this.background,
    required this.displayName,
    required this.developerName,
    required this.fullPortraitV2,
    required this.ability2Desc,
    required this.ability2Name,
    required this.ability2Icon,
    required this.ability3Desc,
    required this.ability3Name,
    required this.ability3Icon,
    required this.ability4Icon,
    required this.ability4Name,
    required this.ability4Desc,
  });
  String ability2Desc;
  String ability2Name;
  String ability2Icon;
  String ability3Desc;
  String ability3Name;
  String ability3Icon;
  String ability4Desc;
  String ability4Name;
  String ability4Icon;
  String displayName;
  String ability1Icon;
  String roleName;
  String background;
  String developerName;
  String fullPortraitV2;
  String description;
  String ability1Desc;
  String ability1Name;
  @override
  State<AgentDetail> createState() => _AgentDetailState();
}

class _AgentDetailState extends State<AgentDetail>
    with TickerProviderStateMixin {
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
                  builder: (context) => const AgentScreen(),
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
                Image(
                  alignment: Alignment.center,
                  image: NetworkImage(widget.background),
                  color: utilitesMain.whiteShadeImage,
                ),
                dropShadow(),
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
                    title: utilitesMain.textDesc,
                    description: widget.displayName,
                  ),
                  ReusableRow(
                    title: utilitesMain.textOrigin,
                    description: widget.developerName,
                  ),
                  ReusableRow(
                    title: utilitesMain.textRole,
                    description: widget.roleName,
                  ),
                  ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: TextWithDynamicTheme(
                          text: utilitesMain.textDesc,
                          fontSize: utilitesMain.fontSizeSmall,
                          color: utilitesMain.textRedShadeColor,
                        ),
                      ),
                      subtitle: TextWithDynamicTheme(
                        text: widget.description,
                        fontSize: utilitesMain.fontSizeSmall,
                        color: utilitesMain.textWhiteColor,
                      )),
                  Divider(
                    color: utilitesMain.textDividColor,
                  ),
                  const SizedBox(height: 40),

                  // * ABILITIES TITLE TEXT
                  Padding(
                    padding: utilitesMain.padLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextWithDynamicTheme(
                            text: utilitesMain.textAbilites,
                            fontSize: utilitesMain.fontSizeBig,
                            color: utilitesMain.textRedShadeColor)),
                  ),
                  // *   AGENT ABILITES WITH EXTRACT ABILITES WIDGET
                  Padding(
                      padding: utilitesMain.padNormal,
                      // * SKILL 1
                      child: AbilityWidget(
                        abilityDesc: widget.ability1Desc,
                        abilityIcon: widget.ability1Icon,
                        abilityName: widget.ability1Name,
                        widget: widget,
                      )),
                  Padding(
                      padding: utilitesMain.padNormal,
                      // * SKILL 2
                      child: AbilityWidget(
                        abilityDesc: widget.ability2Desc,
                        abilityIcon: widget.ability2Icon,
                        abilityName: widget.ability2Name,
                        widget: widget,
                      )),
                  Padding(
                      padding: utilitesMain.padNormal,
                      // * SKILL 3
                      child: AbilityWidget(
                        abilityDesc: widget.ability3Desc,
                        abilityIcon: widget.ability3Icon,
                        abilityName: widget.ability3Name,
                        widget: widget,
                      )),
                  Padding(
                      padding: utilitesMain.padNormal,
                      // * SKILL 4
                      child: AbilityWidget(
                        abilityDesc: widget.ability4Desc,
                        abilityIcon: widget.ability4Icon,
                        abilityName: widget.ability4Name,
                        widget: widget,
                      )),
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
        height: 500,
        fit: BoxFit.fitHeight,
        image: NetworkImage(widget.fullPortraitV2),
      ),
    );
  }
}

// * UTILITES FOR MAIN WIDGET
class _UtilitesMain {
  final String textOrigin = "ORIGIN : ";
  final String textName = "NAME";
  final String textRole = "ROLE";
  final String textDesc = "DESCRIPTION";
  final String textAbilites = "ABILITES";
  final Color textRedShadeColor = Colors.red.shade400;
  final Color textWhiteColor = Colors.white;
  final Color textDividColor = Colors.white;
  final Color cardColor = const Color.fromARGB(255, 19, 31, 45);
  final EdgeInsets padLeft = const EdgeInsets.only(left: 10);
  final EdgeInsets padNormal = const EdgeInsets.all(8);
  final double fontSizeBig = 35;
  final double fontSizeSmall = 14;
  final Color whiteShadeImage = Colors.white.withOpacity(0.5);
}

// * EXTRACT ABILITY WIDGET
class AbilityWidget extends StatelessWidget with _UtilitesAbility {
  AbilityWidget({
    super.key,
    required this.widget,
    required this.abilityIcon,
    required this.abilityName,
    required this.abilityDesc,
  });

  final Widget widget;
  final String abilityIcon;
  final String abilityName;
  final String abilityDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
        // * BOX DECO DESIGN
        decoration: BoxDecoration(
          color: _UtilitesAbility().contMainColor,
          border: _UtilitesAbility().contBorder,
          borderRadius: _UtilitesAbility().contRadius,
        ),
        height: _UtilitesAbility().height,
        width: _UtilitesAbility().width,
        child: Padding(
          padding: _UtilitesAbility().padAllSmall,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: _UtilitesAbility().padLeft,
                // * SKILL NAME
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextWithDynamicTheme(
                      text: abilityName,
                      color: _UtilitesAbility().textRedShade,
                      fontSize: _UtilitesAbility().fontSizeBig,
                    )),
              ),
              Row(
                children: [
                  // * ROW FOR SKILLICON AND TYPE AND COST FIELDS
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: _UtilitesAbility().padAllSmall,
                      child: Image(
                        image: NetworkImage(abilityIcon),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        TextWithDynamicTheme(
                          text: _UtilitesAbility().textType,
                        ),
                        TextWithDynamicTheme(
                          text: _UtilitesAbility().textCost,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // * SKILL DESCRIPTION
              Padding(
                padding: _UtilitesAbility().padAllBig,
                child: TextWithDynamicTheme(
                    text: abilityDesc,
                    fontSize: _UtilitesAbility().fontSizeSmall),
              ),
            ],
          ),
        ));
  }
}

// * REUSABLE ROW WIDGET
class ReusableRow extends StatelessWidget with _UtilitesRow {
  ReusableRow({super.key, required this.title, required this.description});

  final String title, description;

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
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: _UtilitesRow().fontSize,
                    color: _UtilitesRow().textRedShade),
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
          Divider(
            color: _UtilitesRow().textDivid,
          ),
        ],
      ),
    );
  }
}

// * UTILITES FOR EXTRACT WIDGET
// * REUSABLE ROW
class _UtilitesRow {
  final Color textWhite = Colors.white;
  final Color textDivid = Colors.white;
  final Color textRedShade = Colors.red.shade400;
  final double fontSize = 20;
  final EdgeInsets padReuasRow =
      const EdgeInsets.only(left: 14, right: 10, top: 10, bottom: 5);
}

// * ABILITY CONTAINER
class _UtilitesAbility {
  final Color contMainColor = const Color.fromARGB(50, 0, 0, 0);
  final Color textRedShade = Colors.red.shade400;
  final Border contBorder = Border.all(color: Colors.red.shade400, width: 1.4);
  final BorderRadius contRadius = BorderRadius.circular(3);
  final double height = 430;
  final double width = 375;
  final double fontSizeBig = 35;
  final double fontSizeSmall = 14;
  final EdgeInsets padAllSmall = const EdgeInsets.all(8.0);
  final EdgeInsets padAllBig = const EdgeInsets.all(8.0);
  final EdgeInsets padLeft = const EdgeInsets.only(left: 20);
  final String textType = "Type: DAMAGE";
  final String textCost = "Cost: 3000";
}

// * TEXT WIDGET WITH DYNAMIC THEME
// ignore: must_be_immutable
class TextWithDynamicTheme extends StatelessWidget {
  TextWithDynamicTheme({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
  });

  String text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
