import 'dart:math';

import 'package:coronaide/header.dart';
import 'package:coronaide/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomActivity extends StatefulWidget {
  @override
  _RandomActivityState createState() => _RandomActivityState();
}

class _RandomActivityState extends State<RandomActivity> {
  final Random random = Random();
  final List<Activity> activities = [
    Activity(
        image: AssetImage('assets/tibo.jpg'),
        text: 'Deviens ÉNORME ET SEC avec le live workout de Tibo InShape !'),
    Activity(
        image: AssetImage('assets/fastgood.jpg'),
        text:
            'Apprends à cuisiner de bon petits plats facilement sur le live de FastGoodCuisine !'),
    Activity(
        image: AssetImage('assets/sissy.jpg'),
        text: 'Reste en forme grâce au live fitness de Sissy Mua !'),
    Activity(
        image: AssetImage('assets/paul.jpg'),
        text:
            'Paul vous propose de partager son amour pour l’humour franco-anglais !'),
  ];

  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int page = 10 + random.nextInt(10);
      _controller.animateToPage(
        page,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400 * page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Activité Aléatoire',
      ),
      body: PageView.builder(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ActivityPage(
            activity: activities[random.nextInt(activities.length)],
          );
        },
      ),
    );
  }
}

class Activity {
  final String text;
  final ImageProvider image;

  Activity({@required this.text, @required this.image});
}

class ActivityPage extends StatelessWidget {
  final Activity activity;

  const ActivityPage({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image(
            image: activity.image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
              ),
            ],
          ),
          child: Text(
            activity.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorButton(
              text: 'Arrêter',
              color: Color(0xFFFF711B),
              width: 150,
            ),
            SizedBox(width: 16),
            ColorButton(
              text: 'Commencer',
              color: Color(0xFFFF711B),
              width: 150,
            ),
          ],
        ),
      ],
    );
  }
}
