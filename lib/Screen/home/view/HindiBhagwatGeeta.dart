import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Geeta_provider.dart';

class HindiScreen extends StatelessWidget {
  const HindiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GeetaProvider geetaProviderFalse =
        Provider.of<GeetaProvider>(context, listen: false);
    GeetaProvider geetaProviderTrue =
        Provider.of<GeetaProvider>(context, listen: true);

    return Scaffold(
      body: ListView.builder(
        itemCount: geetaProviderTrue.geetaModalList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(geetaProviderTrue.geetaModalList[index].chapterName.toString()),
          ),
        ),
      ),
    );
  }
}
