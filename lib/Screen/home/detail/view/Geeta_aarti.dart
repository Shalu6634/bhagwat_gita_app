import 'package:flutter/material.dart';

import '../../../../utils/aarti.dart';

class AartiScreen extends StatelessWidget {
  const AartiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'श्रीमद भगवत गीता',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // Container(
                    //   height: 410,
                    //   width: 410,
                    //   child: Image.asset("assets/bg1.png",fit: BoxFit.cover,),
                    //
                    // ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                      height: 150,
                      width: 300,
                      child: Image.asset(
                        'asset/img/b.png',
                        fit: BoxFit.cover,
                      )),
                  Container(
                      height: 900,
                      width: 410,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 850,
                              width: 380,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                border:
                                Border.all(color: Colors.orange, width: 3),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("गीता आरती",
                                      style: TextStyle(fontSize: 25)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ...List.generate(
                                  aartilist.length,
                                      (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(aartilist[index],
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                ),
                                SizedBox(
                                  height: 130,
                                ),
                              ]),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
