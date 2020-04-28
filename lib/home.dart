import 'package:coronaide/activities.dart';
import 'package:coronaide/chats.dart';
import 'package:coronaide/contacts.dart';
import 'package:coronaide/header.dart';
import 'package:coronaide/help.dart';
import 'package:coronaide/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Bienvenue',
        subtitle: 'Que faisons-nous aujourd\'hui ?',
        isRoot: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            MapWidget(
              text: 'Voir la Carte',
              color: Color(0xFFA89AE6),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => HelpMap(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ColorButton(
                    text: 'Proposer mon aide',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => OfferHelp(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  ColorButton(
                    text: 'Demander de l\'aide',
                    color: Color(0xFF7CB766),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => AskHelp(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  ColorButton(
                    text: 'Voir les activités',
                    color: Color(0xFFE32C64),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return Activities();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class MapWidget extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onTap;

  const MapWidget({
    Key key,
    @required this.text,
    @required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black26),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GoogleMaps(
              showControls: false,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ColorButton(
                text: text,
                color: color,
                onTap: onTap,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onTap;
  final double width;
  final double height;

  const ColorButton({
    Key key,
    @required this.text,
    @required this.color,
    this.onTap,
    this.width = double.infinity,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: color,
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BottomBarIcon(
            title: 'Contacts',
            icon: CupertinoIcons.group_solid,
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Contacts(),
                ),
              );
            },
          ),
          BottomBarIcon(
            title: 'Chat',
            icon: CupertinoIcons.conversation_bubble,
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Chats(),
                ),
              );
            },
          ),
          BottomBarIcon(
            title: 'Demandes',
            icon: CupertinoIcons.mail_solid,
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Scaffold(
                    appBar: Header(
                      title: 'Demandes',
                    ),
                  ),
                ),
              );
            },
          ),
          BottomBarIcon(
            title: 'Paramètres',
            icon: CupertinoIcons.settings_solid,
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Scaffold(
                    appBar: Header(
                      title: 'Paramètres',
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final void Function() onTap;

  const BottomBarIcon({
    Key key,
    @required this.title,
    @required this.icon,
    this.iconSize = 50,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Color(0xFF5B5B5B),
            size: iconSize,
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF5B5B5B),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
