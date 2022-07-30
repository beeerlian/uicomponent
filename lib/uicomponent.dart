library uicomponent;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'boarding_widget/boarding_widget.dart';
part 'button/rounded_button.dart';
part 'chip/group_chip.dart';
part 'configs/colors.dart';
part 'configs/style.dart';
part 'container/rounded_container.dart';
part 'divide/divide.dart';
part 'image_viewer/asset_image_viewer.dart';
part 'image_viewer/network_image_viewer.dart';
part 'radio/my_radio.dart';
part 'route_not_found/route_not_found.dart';
part 'scroll_behaviour/no_glow_scroll_behavior.dart';
part 'slider/slider_viewer.dart';
part 'svg_viewer/svg_viewer.dart';
part 'text/my_text.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
