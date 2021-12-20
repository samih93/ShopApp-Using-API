import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkThem() => ThemeData(
      scaffoldBackgroundColor: HexColor('#525252'),
      primarySwatch: Colors.deepOrange,
      appBarTheme: AppBarTheme(
          backgroundColor: HexColor('#525252'),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.white),
          backwardsCompatibility: false,
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('#525252'),
            statusBarIconBrightness: Brightness.light,
          )),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('#525252'),
          unselectedItemColor: Colors.grey),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );

ThemeData lightTheme() => ThemeData(
      primarySwatch: Colors.deepOrange,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black),
          backwardsCompatibility: false,
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          )),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
