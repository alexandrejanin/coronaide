import 'package:coronaide/header.dart';
import 'package:coronaide/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Proposer de l\'aide',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          HelpTile(
            title: 'Aide en personne',
            text: "Proposer une aide physique signifie "
                "que vous aidez quelqu'un en personne. "
                "En allant faire des courses ou en accompagnant"
                " quelqu'un par exemple.",
            color: Color(0xFF1E7DF2),
          ),
          SizedBox(height: 16),
          HelpTile(
            title: 'Aide à distance',
            text: "Vous souhaitez aider les personnes "
                "autour de vous ? Proposez une aide "
                "à distance par du soutient moral, "
                "de l'aide aux devoirs...",
            color: Color(0xFF1E7DF2),
          ),
        ],
      ),
    );
  }
}

class HelpTile extends StatelessWidget {
  final String title;
  final String text;
  final Color color;

  const HelpTile({
    Key key,
    @required this.title,
    @required this.text,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ColorButton(
            width: 200,
            text: title,
            color: color,
          ),
          SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF5C5C5C),
            ),
          ),
        ],
      ),
    );
  }
}

class AskHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Demander de l\'aide',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          HelpTile(
            title: 'Aide en personne',
            text: "Proposer une aide physique signifie "
                "que vous aidez quelqu'un en personne. "
                "En allant faire des courses ou en accompagnant"
                " quelqu'un par exemple.",
            color: Color(0xFF7CB766),
          ),
          SizedBox(height: 16),
          HelpTile(
            title: 'Aide à distance',
            text: "Vous souhaitez aider les personnes "
                "autour de vous ? Proposez une aide "
                "à distance par du soutient moral, "
                "de l'aide aux devoirs...",
            color: Color(0xFF7CB766),
          ),
        ],
      ),
    );
  }
}
