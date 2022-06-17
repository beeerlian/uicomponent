part of '../uicomponent.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(context),
    fontFamily: 'Inter',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}

TextTheme textTheme(BuildContext context) {
  // return GoogleFonts.interTextTheme(Theme.of(context).textTheme);
  return TextTheme(
    bodyText1: TextStyle(
      color: ColorTheme.primaryTextColor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}
