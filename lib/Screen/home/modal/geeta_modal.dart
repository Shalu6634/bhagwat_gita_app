import 'package:flutter/material.dart';

class GeetaModal {
  late int Chapter;
  late List<Verse> verses;
  late ChapterName chapterName;

  GeetaModal(
      {required this.Chapter, required this.verses, required this.chapterName});

  factory GeetaModal.fromJson(Map m1) {
    return GeetaModal(
      Chapter: m1['Chapter'],
      verses: (m1['Verses'] as List).map((e) => Verse.fromJson(e)).toList(),
      chapterName: ChapterName.fromJson(m1['ChapterName']),
    );
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
  late Language text;

  Verse({required this.VerseNumber, required this.text});

  factory Verse.fromJson(Map m1) {
    return Verse(VerseNumber: m1['VerseNumber'], text: Language.fromJson(m1['Text']));
  }
}

class Language {
  late String Gujarati, Sanskrit, Hindi, English;

  Language(
      {required this.English,
      required this.Gujarati,
      required this.Hindi,
      required this.Sanskrit});

  factory Language.fromJson(Map m1) {
    return Language(
        English: m1['English'],
        Gujarati: m1['Gujarati'],
        Hindi: m1['Hindi'],
        Sanskrit: m1['Sanskrit']);
  }
}
