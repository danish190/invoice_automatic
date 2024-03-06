import 'package:flutter/material.dart';

class BigText extends StatefulWidget {
  final String textLabel;
   final Color color;
   final FontWeight fontWeight;
    final double fontSize;

   const BigText({super.key, required this.textLabel,required this.fontWeight,required this.color, required this.fontSize});

  @override
  State<BigText> createState() => _BigTextState();
}

class _BigTextState extends State<BigText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.textLabel, style: TextStyle(
      fontSize: widget.fontSize ,
      color: widget.color,
      fontWeight: widget.fontWeight,
    ),);
  }
}