import 'package:coronaide/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Messages',
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFFEDEBE6),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Color(0xFF858485),
                  size: 24,
                ),
                Expanded(
                  child: CupertinoTextField(
                    placeholder: 'Rechercher',
                    decoration: null,
                  ),
                ),
                Icon(
                  CupertinoIcons.mic_solid,
                  color: Color(0xFF858485),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Color(0xFFEDEBE6),
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 6),
                  Text(
                    'Nouvelle Discussion',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1E7DF2),
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.add),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Chat(
            name: 'Yvette',
            newMessages: true,
            online: true,
            time: '20:06',
            message:
                'Pas de soucis, rendez-vous a 11h pour les devoirs de Claude. Aujourd\'hui on fait de...',
          ),
          Chat(
            name: 'Étienne',
            newMessages: true,
            time: 'Hier',
            message:
                'Je passerai Mercredi matin pour vous apporter vos courses.',
          ),
          Chat(
            name: 'Jean',
            online: true,
            time: 'Hier',
            message:
                'Je vais voir si Julie  est disponible et je te redis ça dans la semaine pour s\'organiser !',
          ),
          Chat(
            name: 'Marie',
            time: 'Lundi',
            message: 'Merci beaucoup pour les conseils Sacha ;)',
          ),
        ],
      ),
    );
  }
}

class Chat extends StatelessWidget {
  final String name;
  final String time;
  final String message;
  final bool newMessages;
  final bool online;

  const Chat({
    Key key,
    @required this.name,
    @required this.time,
    @required this.message,
    this.newMessages = false,
    this.online = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 1.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  if (newMessages)
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                ],
              ),
              Text(
                time,
                style: TextStyle(
                  color: Color(0xFF1E7DF2),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                CupertinoIcons.person_solid,
                size: 50,
                color: online ? null : Color(0xFF5B5B5B),
              ),
              SizedBox(width: 2),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
