import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:clipboard/clipboard.dart';
import 'package:bhagwat_gita_app/Screen/home/provider/Geeta_provider.dart';
import 'package:bhagwat_gita_app/Screen/home/provider/geetaDetailProvider.dart';
import 'package:bhagwat_gita_app/Screen/home/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../../../../utils/global.dart';
import '../../BhagwatGeeta.dart';
import '../../HomeScreen.dart';

List<GlobalKey> imgKey = List.generate(50, (index) => GlobalKey());

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

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
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);
    GeetaDetailProvider geetaDetailProvider =
    Provider.of<GeetaDetailProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.orange,
          scrolledUnderElevation: 0.1,

          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          title: Text(
            (geetaDetailProvider.selectedLanguage == 'Sanskrit')
                ? geetaProvider
                .geetaModalList[selectedIndex].chapterName.Sanskrit
                : (geetaDetailProvider.selectedLanguage == 'Hindi')
                ? geetaProvider
                .geetaModalList[selectedIndex].chapterName.Hindi
                : (geetaDetailProvider.selectedLanguage == 'English')
                ? geetaProvider
                .geetaModalList[selectedIndex].chapterName.English
                : geetaProvider
                .geetaModalList[selectedIndex].chapterName.Gujarati,
          ),
          actions: [
            DropdownButton(
              value: geetaDetailProvider.selectedLanguage,
              onChanged: (String? value) {
                geetaDetailProvider.LanguageTranslator(value!);
              },
              items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ]),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: geetaProvider.geetaModalList[selectedIndex].verses.length,
        itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 20),
              child: Center(
                child: RepaintBoundary(
                  key: imgKey[index],
                  child: Container(
                    height: height * 0.99,
                    width: width * 0.9,
                    child: Column(
                      children: [
                        Text(
                          '~: श्लोक :~\n',
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onPrimary,
                            fontSize: 25,
                            shadows: [
                              Shadow(
                                color: Colors.white,
                                blurRadius: 15,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            RenderRepaintBoundary boundary = imgKey[selectedIndex]
                                .currentContext!
                                .findRenderObject() as RenderRepaintBoundary;

                            ui.Image image = await boundary.toImage();
                            ByteData? bytedata = await image.toByteData(
                                format: ui.ImageByteFormat.png);
                            Uint8List img = bytedata!.buffer.asUint8List();
                            ImageGallerySaver.saveImage(img);
                            final path = await getApplicationDocumentsDirectory();
                            File file = File("${path.path}/img.png");
                            file.writeAsBytes(img);
                            ShareExtend.share(file.path, "image");
                          },
                          child: Icon(
                            Icons.share,
                            size: 26,
                          ),
                        ),
                        SelectableText(
                          textAlign: TextAlign.center,
                          geetaProvider.geetaModalList[selectedIndex]
                              .verses[index]
                              .text.Sanskrit,
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onPrimary,
                            fontSize: 20,
                            shadows: [Shadow(
                                color: Colors.white, blurRadius: 15)
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.33,
                          width: width * 0.95,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Text(
                                  '|| अनुवाद ||\n',
                                  style: TextStyle(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .onPrimary,
                                    fontSize: 25,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white,
                                        blurRadius: 15,
                                      )
                                    ],
                                  ),
                                ),
                                SelectableText(
                                  textAlign: TextAlign.center,
                                  (geetaDetailProvider.selectedLanguage ==
                                      'Sanskrit')
                                      ? geetaProvider
                                      .geetaModalList[selectedIndex]
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
                                  // gitaProvider.gitaModalList[selectIndex].verses[index]
                                  //     .language.Sanskrit,
                                  style: TextStyle(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .onPrimary,
                                    fontSize: 20,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white,
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
    Container shloksContainer({
      required double height,
      required double width,
      required GeetaProvider geetaProvider,
      required int index,
      required GeetaDetailProvider geetaDetailProvider,
      required context,
      required HomeScreenProvider homeScreenProvider,
    }) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              (geetaDetailProvider.selectedLanguage == 'Sanskrit')
                  ? geetaProvider.geetaModalList[selectedIndex].verses[index]
                  .text.Sanskrit
                  : (geetaDetailProvider.selectedLanguage == 'Hindi')
                  ? geetaProvider.geetaModalList[selectedIndex].verses[index]
                  .text.Hindi
                  : (geetaDetailProvider.selectedLanguage == 'English')
                  ? geetaProvider.geetaModalList[selectedIndex]
                  .verses[index].text.English
                  : geetaProvider.geetaModalList[selectedIndex]
                  .verses[index].text.Gujarati,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: Colors.blue,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Random random = Random();
                    int x = random.nextInt(imgList.length);
                    showDialog(
                      context: context,
                      builder: (context) => Dialog.fullscreen(
                        backgroundColor: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RepaintBoundary(
                                key: repaintBoundaryKey,
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                  ),
                                  child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        (geetaDetailProvider

                                            .selectedLanguage ==
                                            'Sanskrit')
                                            ? geetaProvider
                                            .geetaModalList[selectedIndex]
                                            .chapterName
                                            .Sanskrit
                                            : (geetaDetailProvider
                                            .selectedLanguage ==
                                            'Hindi')
                                            ? geetaProvider
                                            .geetaModalList[selectedIndex]
                                            .chapterName
                                            .Hindi
                                            : (geetaDetailProvider
                                            .selectedLanguage ==
                                            'English')
                                            ? geetaProvider
                                            .geetaModalList[
                                        selectedIndex]
                                            .chapterName
                                            .English
                                            : geetaProvider
                                            .geetaModalList[
                                        selectedIndex]
                                            .chapterName
                                            .Gujarati,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      Text(
                                        (geetaDetailProvider
                                            .selectedLanguage ==
                                            'Sanskrit')
                                            ? geetaProvider
                                            .geetaModalList[selectedIndex]
                                            .verses[index]
                                            .text
                                            .Sanskrit
                                            : (geetaDetailProvider
                                            .selectedLanguage ==
                                            'Hindi')
                                            ? geetaProvider
                                            .geetaModalList[selectedIndex]
                                            .verses[index]
                                            .text
                                            .Hindi
                                            : (geetaDetailProvider
                                            .selectedLanguage ==
                                            'English')
                                            ? geetaProvider
                                            .geetaModalList[
                                        selectedIndex]
                                            .verses[index]
                                            .text
                                            .English
                                            : geetaProvider
                                            .geetaModalList[
                                        selectedIndex]
                                            .verses[index]
                                            .text
                                            .Gujarati,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    RenderRepaintBoundary boundary = repaintBoundaryKey
                                        .currentContext!
                                        .findRenderObject()
                                    as RenderRepaintBoundary;

                                    ui.Image image = await boundary.toImage();
                                    ByteData? byteData = await image.toByteData(
                                        format: ui.ImageByteFormat.png);

                                    Uint8List img =
                                    byteData!.buffer.asUint8List();

                                    final imgPath =
                                    await getApplicationDocumentsDirectory();
                                    final file = File("${imgPath.path}/img.png");

                                    file.writeAsBytes(img);
                                    ShareExtend.share(file.path, 'image');
                                  },
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    RenderRepaintBoundary boundary = repaintBoundaryKey
                                        .currentContext!
                                        .findRenderObject()
                                    as RenderRepaintBoundary;

                                    ui.Image image = await boundary.toImage();

                                    ByteData? byteData = await image.toByteData(
                                        format: ui.ImageByteFormat.png);

                                    Uint8List img =
                                    byteData!.buffer.asUint8List();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(10),
                                        content: Text('Saved to the gallery!'),
                                      ),
                                    );

                                    ImageGallerySaver.saveImage(img);
                                  },
                                  icon: const Icon(
                                    Icons.save_alt,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FlutterClipboard.copy(
                      (geetaDetailProvider.selectedLanguage == 'Sanskrit')
                          ? geetaProvider.geetaModalList[selectedIndex]
                          .verses[index].text.Sanskrit
                          : (geetaDetailProvider.selectedLanguage == 'Hindi')
                          ? geetaProvider.geetaModalList[selectedIndex]
                          .verses[index].text
                          .Hindi
                          : (geetaDetailProvider.selectedLanguage ==
                          'English')
                          ? geetaProvider.geetaModalList[selectedIndex]
                          .verses[index].text.English
                          : geetaProvider.geetaModalList[selectedIndex]
                          .verses[index].text.Gujarati,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(10),
                        content: Text('Copied to clipboard'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
