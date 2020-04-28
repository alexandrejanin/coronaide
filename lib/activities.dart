import 'package:coronaide/header.dart';
import 'package:coronaide/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Activités',
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: SearchBar(),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.orange,
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.settings,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Sport',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFBEBEC6),
              ),
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ActivityTile(
                    name: index % 2 == 0 ? 'Sissy Mua' : 'Vanille',
                    description: 'Coach Sportive',
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Cuisine',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFBEBEC6),
              ),
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ActivityTile(
                    name: index % 2 == 0 ? 'FastGoodCuisine' : 'Thierry Marx',
                    description: index % 2 == 0 ? 'Youtubeur' : ' Chef',
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Jeux de société',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFBEBEC6),
              ),
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ActivityTile(
                    name:
                        index % 2 == 0 ? 'Fabien Olicard' : 'McFly et Carlito',
                    description: 'Youtubeur',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String name;
  final String description;

  const ActivityTile({
    Key key,
    @required this.name,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          color: Colors.white30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
