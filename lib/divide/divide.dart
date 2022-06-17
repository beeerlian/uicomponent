import 'package:flutter/material.dart';

class Divide extends StatelessWidget {
  const Divide({Key? key, this.height = 0, this.width = 0}) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
    );
  }
}
