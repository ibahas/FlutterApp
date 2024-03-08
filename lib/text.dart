import 'package:flutter/material.dart';

TextStyle s24 = const TextStyle(
  color: Colors.white,
  fontSize: 24,
);

TextStyle s20 = const TextStyle(
  color: Colors.white,
  fontSize: 20,
);

class MyText extends StatelessWidget {
  final String _text;
  final TextStyle _style;

  const MyText(this._text, this._style, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: _style,
    );
  }
}
