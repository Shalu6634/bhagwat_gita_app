import 'package:flutter/material.dart';

import '../../../../utils/geeta_mahatmy.dart';

class MahatmayScreen extends StatelessWidget {
  const MahatmayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: height * 0.4,
              width: width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/geeta3.png'),
                  ),
                  color: Colors.yellow),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Image.asset(
                      fit: BoxFit.cover,
                      'assets/img/geeta2.png',
                      height: height * 0.2,
                      width: width * 0.4,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0200,
                  ),
                  Center(
                    child: Container(
                      height: height * 0.5 + 30,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            ...List.generate(
                                mahatmay.length,
                                    (index) =>
                                    Column(
                                      children: [
                                        Text(mahatmay[index]),
                                      ],
                                    )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),);
  }
}