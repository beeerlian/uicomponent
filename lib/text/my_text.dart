import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicomponent/configs/colors.dart';

class MyText extends StatelessWidget {
  MyText(this.text,
      {Key? key,
      this.weight,
      this.align,
      this.color,
      this.maxLength,
      this.maxLines,
      this.fontSize = 14,
      this.moreText,
      this.isCurrency = false,
      this.currencyPlus = false,
      this.ellipsed,
      this.isUnderlined = false,
      this.currencySymbol,
      this.decoration})
      : super(key: key);

  final String text;
  final String? moreText;
  final String? currencySymbol;
  final FontWeight? weight;
  final TextAlign? align;
  final Color? color;
  final int? maxLength, maxLines;
  final bool? ellipsed;
  final bool isCurrency;
  final bool currencyPlus;
  final double fontSize;
  final bool isUnderlined;
  TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    Color textColor = color ?? ColorTheme.primaryTextColor;
    TextOverflow overFlowFont =
        ellipsed == true ? TextOverflow.ellipsis : TextOverflow.visible;

    TextStyle textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: weight ?? FontWeight.normal,
      color: textColor,
      fontFamily: 'Inter',
      decoration: isUnderlined ? TextDecoration.underline : TextDecoration.none,
    );

    if (maxLength != null) {
      return buildTextSpan(textStyle, overFlowFont);
    }

    return buildText(textStyle, overFlowFont);
  }

  Widget buildText(TextStyle textStyle, TextOverflow overFlowFont) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      style: textStyle,
      overflow: overFlowFont,
      maxLines: maxLines ?? maxLines,
    );
  }

  Widget buildTextSpan(TextStyle textStyle, TextOverflow overFlowFont) {
    bool _isHalf = false;

    if (text.length > (maxLength ?? 25)) {
      _isHalf = true;
    }

    return _isHalf
        ? Text.rich(
            TextSpan(
              text: text.substring(0, (maxLength != null ? maxLength : 25)),
              style: textStyle,
              children: [
                WidgetSpan(
                  child: Text(
                    moreText ?? ' ...',
                    style: textStyle,
                    overflow: overFlowFont,
                  ),
                ),
              ],
            ),
          )
        : buildText(textStyle, overFlowFont);
  }
}

extension ExtendedText on MyText {
  addMargin({padding}) {
    return Container(
      margin: EdgeInsets.all(padding ?? 16),
      child: this,
    );
  }

  addMarginV({vertical}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical ?? 6),
      child: this,
    );
  }

  addMarginH({horizontal}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal ?? 16),
      child: this,
    );
  }
}

extension ContainerMargin on Container {
  addMargin({padding}) {
    return Container(
      margin: EdgeInsets.all(padding ?? 16),
      child: this,
    );
  }

  addMarginV({vertical}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical ?? 6),
      child: this,
    );
  }

  addMarginH({horizontal}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal ?? 16),
      child: this,
    );
  }
}
