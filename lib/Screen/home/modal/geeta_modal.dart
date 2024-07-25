
import 'package:flutter/material.dart';

class GeetaModal {
  late int Chapter;
  late List<Verse> verses;

  GeetaModal({required this.Chapter, required this.verses});

  factory GeetaModal.fromJson(Map m1) {
    return GeetaModal(
        Chapter: m1['Chapter'],
        verses: (m1['verses'] as List).map((e) => Verse.fromJson(e)).toList());
  }
}

class ChapterName {
  late String Hindi, English, Gujarati, Sanskrit;

  ChapterName({
    required this.Hindi,
    required this.Gujarati,
    required this.English,
    required this.Sanskrit,
  });

  factory ChapterName.fromJson(Map m1) {
    return ChapterName(
        Hindi: m1['Hindi'],
        Gujarati: m1['Gujarati'],
        English: m1['English'],
        Sanskrit: m1['Sanskrit']);
  }
}

class Verse {
  late int VerseNumber;
  late TextClass text;

  Verse({required this.VerseNumber, required this.text});

  factory Verse.fromJson(Map m1) {
    return Verse(VerseNumber: m1['VerseNumber'], text: m1['text']);
  }
}

class TextClass {
  late String Gujarati, Sanskrit, Hindi, English;

  TextClass(
      {required this.English,
      required this.Gujarati,
      required this.Hindi,
      required this.Sanskrit});

  factory TextClass.fromJson(Map m1) {
    return TextClass(
        English: m1['English'],
        Gujarati: m1['Gujarati'],
        Hindi: m1['Hindi'],
        Sanskrit: m1['Sanskrit']);
  }
}
