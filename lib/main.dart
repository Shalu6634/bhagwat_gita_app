import 'package:bhagwat_gita_app/Screen/home/provider/Geeta_provider.dart';
import 'package:bhagwat_gita_app/Screen/home/provider/geetaDetailProvider.dart';
import 'package:bhagwat_gita_app/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/home/provider/language_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GeetaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GeetaDetailProvider(),
        ),

      ],
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
