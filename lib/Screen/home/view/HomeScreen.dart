import 'package:bhagwat_gita_app/Screen/home/provider/Geeta_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BhagwatGeeta.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff8e1ae),
      body:
      Column(
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
                                imgList.length,
                                (index) => Box(height, width,
                                    context: context,
                                    img: imgList[index],
                                    text: textList[index]),
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
      ),
    );
  }

  Padding Box(
    double height,
    double width, {
    required String img,
    required String text,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(onTap: (){
    Navigator.of(context).pushNamed('/geeta');
      },
        child: Container(
          height: height * 0.1,
          width: width * 0.8,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfff8b119),
                  Color(0xfff9bf3e),
                ],
              ),
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height * 0.1,
                width: width * 0.1 + 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(img),
                )),
              ),
              SizedBox(
                width: 20,
              ),
              VerticalDivider(
                thickness: 0.07,
                color: Colors.black,
                endIndent: 5,
                indent: 5,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List imgList = [
  'assets/img/p1.png',
  'assets/img/p2.png',
  'assets/img/p3.png',
  'assets/img/p4.png'
];

List textList = ['भागवत गीता', 'गीता सार    ', 'गीता माहात्म्य', 'गीता आरती'];
