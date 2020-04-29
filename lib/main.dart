import 'package:coronaide/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth / constraints.maxHeight < 10 / 16)
            return AppInner();

          return Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black26,
                  ),
                ],
              ),
              child: AspectRatio(
                aspectRatio: 1 / 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRect(
                    child: AppInner(),
                  ),
                ),
              ),
            ),
          );
        },
      );

    return AppInner();
  }
}

class AppInner extends StatelessWidget {
  const AppInner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
