import 'dart:async';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushNamed('/home');
    });
    return Scaffold(
      backgroundColor: Color(0xfffcc838),
      body: Center(
        child: Container(
          height: height * 1,
          width: width * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.6,
              image: AssetImage(
                'assets/img/splash.jpg',
              ),
            ),
          ),
          child: Image.asset(
            'assets/img/geeta4.png',
            color: Colors.white,
            height: height * 0.2,
          ),
        ),
      ),
    );
  }
}
