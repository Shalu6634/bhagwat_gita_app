import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('/second');
    });
    return Scaffold(
      body: 
          Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image : AssetImage('assets/img/geeta.webp'),
                )
              ),
            ),
          ),

    );
  }
}
