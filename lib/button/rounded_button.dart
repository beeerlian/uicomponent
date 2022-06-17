import 'package:flutter/material.dart';
import 'package:uicomponent/configs/colors.dart';

enum RoundedButtonVariant {
  OUTLINE,
  DEFAULT,
  PLAINTEXT,
  PRIMARY_OUTLINED,
  FOLLOW,
  CALL,
  CANCEL,
  CANCEL_OUTLINED
}

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {Key? key,
      this.child,
      this.press,
      this.width,
      this.textColor = ColorTheme.primaryTextColor,
      this.backgroundColor = ColorTheme.primary,
      this.prefix,
      this.disabled,
      this.border = BorderSide.none,
      this.isLoading = false})
      : super(key: key);

  final Widget? child;
  final void Function()? press;
  Color textColor;
  final Widget? prefix;
  final bool? disabled;
  Color backgroundColor;
  double? width;
  final bool isLoading;
  BorderSide border;
  @override
  Widget build(BuildContext context) {
    double height = 48.0;

    if (disabled == true) {
      backgroundColor = ColorTheme.disabled;
      textColor = ColorTheme.secondaryTextColor;
    }

    if (backgroundColor == ColorTheme.primary) {
      textColor = ColorTheme.lightTextColor;
    }

    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(144),
            side: border,
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: press != null && disabled != true ? press : () {},
        child: isLoading
            ? Expanded(
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // divideW8,
                  prefix ?? Container(),
                  Expanded(
                    child: Center(child: child),
                  ),
                ],
              ),
      ),
    );
  }
}
