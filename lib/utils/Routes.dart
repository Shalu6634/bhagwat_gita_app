import 'package:bhagwat_gita_app/Screen/home/detail/view/Geeta_aarti.dart';
import 'package:bhagwat_gita_app/Screen/home/detail/view/geeta_mahatmay.dart';
import 'package:bhagwat_gita_app/Screen/splashScreen.dart';
import 'package:flutter/cupertino.dart';

import '../Screen/SecondPage.dart';

import '../Screen/home/view/BhagwatGeeta.dart';
import '../Screen/home/view/HomeScreen.dart';
import '../Screen/home/detail/view/DetailScreen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => SplashScreen(),
    '/second': (context) => SecondPage(),
    '/home': (context) => HomeScreen(),
    '/geeta': (context) => AadhyaScreen(),
    '/detail': (context) => DetailScreen(),
    '/aarti': (context) => AartiScreen(),
    '/maha': (context) => MahatmayScreen(),
  };
}
