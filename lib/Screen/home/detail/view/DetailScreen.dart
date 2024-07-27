import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:clipboard/clipboard.dart';
import 'package:bhagwat_gita_app/Screen/home/provider/Geeta_provider.dart';
import 'package:bhagwat_gita_app/Screen/home/detail/provider/geetaDetailProvider.dart';
import 'package:bhagwat_gita_app/Screen/home/provider/language_provider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../../../utils/global.dart';
import '../../view/BhagwatGeeta.dart';
import '../../view/HomeScreen.dart';

List<GlobalKey> imgKey = List.generate(50, (index) => GlobalKey());

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);
    GeetaDetailProvider geetaDetailProvider =
        Provider.of<GeetaDetailProvider>(context);
    GeetaDetailProvider geetaDetailProviderFalse =
        Provider.of<GeetaDetailProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff2b200),
        scrolledUnderElevation: 0.1,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 28,
          ),
        ),
        title: Text((geetaDetailProvider.selectedLanguage == 'Sanskrit')
            ? translate[0]
            : (geetaDetailProvider.selectedLanguage == 'Hindi')
                ? translate[1]
                : (geetaDetailProvider.selectedLanguage == 'English')
                    ? translate[2]
                    : translate[3]),
        actions: [
          DropdownButton(
            value: geetaDetailProvider.selectedLanguage,
            onChanged: (String? value) {
              geetaDetailProviderFalse.LanguageTranslator(value!);
            },
            items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: geetaProvider.geetaModalList[selectedIndex].verses.length,
        itemBuilder: (context, index) => Center(
            child: Stack(
          children: [
            RepaintBoundary(
              key: imgKey[index],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: height * 0.5,
                      width: width * 1 + 10,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/img/geeta2.png',
                              height: 70,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          SelectableText(
                            geetaProvider.geetaModalList[selectedIndex]
                                .verses[index].text.Sanskrit,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Center(
                            child: Text(
                              '|| अनुवाद ||\n',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  shadows: [BoxShadow(color: Colors.white)]),
                            ),
                          ),
                          SelectableText(
                            (geetaDetailProvider.selectedLanguage == 'Sanskrit')
                                ? geetaProvider.geetaModalList[selectedIndex]
                                    .verses[index].text.Sanskrit
                                : (geetaDetailProvider.selectedLanguage ==
                                        'Hindi')
                                    ? geetaProvider
                                        .geetaModalList[selectedIndex]
                                        .verses[index]
                                        .text
                                        .Hindi
                                    : (geetaDetailProvider.selectedLanguage ==
                                            'English')
                                        ? geetaProvider
                                            .geetaModalList[selectedIndex]
                                            .verses[index]
                                            .text
                                            .English
                                        : geetaProvider
                                            .geetaModalList[selectedIndex]
                                            .verses[index]
                                            .text
                                            .Gujarati,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    RenderRepaintBoundary boundary =
                                        imgKey[selectedIndex]
                                                .currentContext!
                                                .findRenderObject()
                                            as RenderRepaintBoundary;
                                    ui.Image image = await boundary.toImage();
                                    ByteData? bytedata = await image.toByteData(
                                        format: ui.ImageByteFormat.png);
                                    Uint8List img =
                                        bytedata!.buffer.asUint8List();
                                    ImageGallerySaver.saveImage(img);
                                    final path =
                                        await getApplicationDocumentsDirectory();
                                    File file = File('${path.path}/img.png');
                                    file.writeAsBytes(img);
                                    ShareExtend.share(file.path, 'image');
                                  },
                                  child: Text(
                                    'share',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                              InkWell(onTap: () async {
                                RenderRepaintBoundary boundary =
                                imgKey[selectedIndex]
                                    .currentContext!
                                    .findRenderObject()
                                as RenderRepaintBoundary;
                                ui.Image image = await boundary.toImage();
                                ByteData? bytedata = await image.toByteData(
                                    format: ui.ImageByteFormat.png);
                                Uint8List img =
                                bytedata!.buffer.asUint8List();
                                ImageGallerySaver.saveImage(img);

                              },
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
