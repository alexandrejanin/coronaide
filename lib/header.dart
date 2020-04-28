import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final bool isRoot;
  final bool isProfile;

  const Header({
    Key key,
    @required this.title,
    this.subtitle,
    this.isRoot = false,
    this.isProfile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFEFEF),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isRoot)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
                ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle != null) Text(subtitle),
              SizedBox(height: 8),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (!isProfile)
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: Header(
                          title: 'Mon Profil',
                          isProfile: true,
                        ),
                      );
                    },
                  ),
                );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.profile_circled,
                  size: 50,
                  color: Colors.black54,
                ),
                SizedBox(height: 5),
                Text('Hugo'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110);
}
