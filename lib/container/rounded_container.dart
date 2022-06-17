import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  RoundedContainer(
      {Key? key,
      this.color,
      this.height,
      this.radius,
      this.width,
      this.child,
      this.margin,
      this.border,
      this.padding})
      : super(key: key);

  double? radius;
  BoxBorder? border;
  Color? color;
  double? width;
  double? height;
  Widget? child;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          color: color,
          border: border),
      child: child,
    );
  }
}
