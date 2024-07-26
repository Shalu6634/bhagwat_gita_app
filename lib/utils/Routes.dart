import 'package:bhagwat_gita_app/Screen/splashScreen.dart';
import 'package:flutter/cupertino.dart';

import '../Screen/SecondPage.dart';

import '../Screen/home/view/BhagwatGeeta.dart';
import '../Screen/home/view/HomeScreen.dart';
import '../Screen/home/view/detail/view/DetailScreen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    //   '/':(context)=>SplashScreen(),
    //   '/second':(context)=>SecondPage(),
     '/':(context)=>HomeScreen(),
    '/geeta':(context)=>AadhyaScreen(),
    '/detail':(context)=>DetailScreen(),
  };
}
