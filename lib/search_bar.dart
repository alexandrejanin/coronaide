import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String text;

  const SearchBar({Key key, this.text = 'Recherche'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFECEAEB),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: text,
          prefixIcon: Icon(Icons.search),
          prefixIconConstraints: BoxConstraints(
            minWidth: 30,
            minHeight: 30,
          ),
          suffixIcon: Icon(Icons.mic),
          suffixIconConstraints: BoxConstraints(
            minWidth: 30,
            minHeight: 30,
          ),
        ),
      ),
    );
  }
}
