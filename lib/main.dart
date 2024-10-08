import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'layout/favoriteScreen.dart';
import 'layout/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<Map<String, String>> get favoriteQuoteIds => [];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:  HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (c) => HomeScreen(),
            FavoriteScreen.routeName: (C) => FavoriteScreen(favoriteQuoteIds),
          },
        );
      },
    );
  }
}
