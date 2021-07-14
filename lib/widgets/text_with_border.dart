import 'package:flutter/material.dart';

class TextWithBorder extends StatelessWidget {
  final String text;
  final double fontSize;
  final double borderWidth;
  const TextWithBorder({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = borderWidth
              ..color = Colors.black,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
