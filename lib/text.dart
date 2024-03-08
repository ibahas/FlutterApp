import 'package:flutter/material.dart';

 
 TextStyle s = const TextStyle(
  color: Colors.white,
 );

 TextStyle s2 = const TextStyle(
  color: Colors.black,
 );
 
class MyText extends StatelessWidget {
  String _text;
  TextStyle _style;

  MyText(this._text, this._style);

  @override
  Widget build(BuildContext context) {
    return Text(
      this._text,
      style: _style,
    );
  }
}
