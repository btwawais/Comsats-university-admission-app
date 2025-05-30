
import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  //const Texts({super.key});
  final String? data;
  final Color color;
  final double? size;
  final FontWeight? weight;
  Texts({
    required this.data,
    required this.color,
    this.size,
    required this.weight,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        color: color,
        fontSize: size ?? 12,
        fontWeight: weight,
      ),
    );
  }
}
