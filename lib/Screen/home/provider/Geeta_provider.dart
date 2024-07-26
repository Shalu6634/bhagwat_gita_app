import 'dart:convert';
import 'package:bhagwat_gita_app/Screen/home/modal/geeta_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class GeetaProvider extends ChangeNotifier {
  List<GeetaModal> geetaModalList = [];

  Future<void> JsonParsing() async {
    String json = await rootBundle.loadString('assets/json/bhagwat_data.json');
    List response = jsonDecode(json);
    geetaModalList = response
        .map(
          (e) => GeetaModal.fromJson(e),
        ).toList();
    notifyListeners();
  }

  GeetaProvider() {
    JsonParsing();
  }
}
