import 'package:bhagwat_gita_app/Screen/splashScreen.dart';
import 'package:flutter/cupertino.dart';

import '../Screen/SecondPage.dart';
import '../Screen/home/view/HindiBhagwatGeeta.dart';
import '../Screen/home/view/HomeScreen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    // '/':(context)=>SplashScreen(),
    // '/second':(context)=>SecondPage(),
    '/':(context)=>HomeScreen(),
    '/hindi':(context)=>HindiScreen(),
  };
}
