import 'dart:convert';
import 'package:bhagwat_gita_app/Screen/home/modal/geeta_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class GeetaProvider extends ChangeNotifier
{
  late GeetaModal geetaModal;
  Future<void> intiGeeta()
  async {
    String json = await rootBundle.loadString('assets/json/bhagwat_data.json');
   final response = jsonDecode(json);
   geetaModal = GeetaModal.fromJson(response);
   notifyListeners();
  }

  GeetaProvider()
  {
    intiGeeta();
  }
}