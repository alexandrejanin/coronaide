import 'package:coronaide/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Contacts',
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
                    'Nouveau Contact',
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
          Contact(
            name: 'Yvette',
            favorite: true,
            online: true,
          ),
          Contact(
            name: 'Étienne',
            favorite: true,
          ),
          Contact(
            name: 'Jean',
            online: true,
          ),
          Contact(
            name: 'Marie',
          ),
        ],
      ),
    );
  }
}

class Contact extends StatelessWidget {
  final String name;
  final bool favorite;
  final bool online;

  const Contact({
    Key key,
    @required this.name,
    this.favorite = false,
    this.online = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (favorite)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (online)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    'En ligne',
                    style: TextStyle(
                      color: Color(0xFF1E7DF2),
                    ),
                  ),
                ),
              Icon(
                CupertinoIcons.person_solid,
                size: 50,
                color: online ? null : Color(0xFF5B5B5B),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
