import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xFFFFCC00);
const lightColor = const Color(0xFFFFFFFF);
const backgroudColor = const Color(0xFFF5F5F5);

ThemeData darkYellowTheme() {
  return ThemeData(
    // primarySwatch: primaryColor,
    brightness: brightness,
      /* textTheme: new TextTheme(
       title: TextStyle(color: lightColor),
       body1: new TextStyle(color: Colors.red),
       display4: new TextStyle(fontSize: 78),
       button: new TextStyle(color: Colors.green),
       headline: new TextStyle(color: Colors.deepPurple)
     ),*/
    // tabBarTheme:
    // accentIconTheme:
    // accentTextTheme:
    // appBarTheme:
    // bottomAppBarTheme:
    // buttonTheme: new ButtonThemeData(
    //   buttonColor: Colors.orange,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // cardTheme: CardTheme(
    //   elevation: 5,
    //   color: Colors.indigo,
    // ),
    // chipTheme:
    // dialogTheme:
    // floatingActionButtonTheme:
    // iconTheme:
    // inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    //primaryTextTheme:
    // sliderTheme:
      primaryColor: primaryColor,
      accentColor: Colors.white,
      // fontFamily: 'Montserrat',
      buttonColor: primaryColor,
      // // scaffoldBackgroundColor: backgroundColor,
      // cardColor: Colors.white,

      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: lightColor),
          actionsIconTheme: IconThemeData(color: lightColor),
          textTheme: TextTheme(
              title: TextStyle(
                  color: lightColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold))));
}
