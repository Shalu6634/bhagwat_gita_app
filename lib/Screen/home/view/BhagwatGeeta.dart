import 'package:bhagwat_gita_app/Screen/home/detail/provider/geetaDetailProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Geeta_provider.dart';

class AadhyaScreen extends StatelessWidget {
  const AadhyaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    GeetaProvider geetaProviderFalse =
        Provider.of<GeetaProvider>(context, listen: false);
    GeetaProvider geetaProviderTrue =
        Provider.of<GeetaProvider>(context, listen: true);

    GeetaDetailProvider geetaDetailProviderFalse =
        Provider.of<GeetaDetailProvider>(context, listen: false);
    GeetaDetailProvider geetaDetailProviderTrue =
        Provider.of<GeetaDetailProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff8b119),
          title: Text(
            (geetaDetailProviderTrue.selectedLanguage == 'Sanskrit')
                ? translate[0]
                : (geetaDetailProviderTrue.selectedLanguage == 'Hindi')
                    ? translate[1]
                    : (geetaDetailProviderTrue.selectedLanguage == 'English')
                        ? translate[2]
                        : translate[3],
          ),
          actions: [
            DropdownButton(
              value: geetaDetailProviderTrue.selectedLanguage,
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
        body: Container(
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/kanha.jpg'),
              )),
          child: ListView.builder(
            itemBuilder: (context, index) => Column(
              children: [
                ...List.generate(
                  geetaProviderTrue.geetaModalList.length,
                      (index) => Box1(
                    height: height,
                    width: width,
                    index: index,
                    geetaDetailProvider: geetaDetailProviderTrue,
                    geetaProvider: geetaProviderTrue,
                    context: context,
                  ),
                )
              ],
            ),
          ),
        )

      );
  }

  Widget Box1({
    required double height,
    required double width,
    required int index,
    required BuildContext context,
    required GeetaDetailProvider geetaDetailProvider,
    required GeetaProvider geetaProvider,
  }) {
    return GestureDetector(
      onTap: () {
          selectedIndex = index;
          Navigator.of(context).pushNamed('/detail');

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height * 0.1,
          width: width * 0.9,
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                (geetaDetailProvider.selectedLanguage == 'Sanskrit')
                    ? geetaProvider.geetaModalList[index].chapterName.Sanskrit
                    : (geetaDetailProvider.selectedLanguage == 'Hindi')
                        ? geetaProvider.geetaModalList[index].chapterName.Hindi
                        : (geetaDetailProvider.selectedLanguage == 'English')
                            ? geetaProvider
                                .geetaModalList[index].chapterName.English
                            : geetaProvider
                                .geetaModalList[index].chapterName.Gujarati,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.020),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List translate = [
  'अध्यायः',
  'अध्याय',
  'Chapter',
  'પ્રકરણ',
];

int selectedIndex = 0;
