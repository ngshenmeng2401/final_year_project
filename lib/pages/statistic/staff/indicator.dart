import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String? text;
  final bool? isSquare;
  final double? size;

  const Indicator({
    Key? key,
    this.color,
    this.textColor = Colors.white,
    this.text,
    this.isSquare,
    this.size = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare! ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text!,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
          ),
        )
      ],
    );
  }
}