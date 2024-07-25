import 'dart:async';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('/home');
    });
    return Scaffold(
      backgroundColor: Color(0xfffcc838),
      body:
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/geeta2.png'),
                ),
            ),
                  ),
          ),
    );
  }
}
