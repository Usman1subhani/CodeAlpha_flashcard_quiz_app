import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/flashcard.dart';

class FlashcardData {
  static List<Flashcard> flashcards = [];

  static Future<void> addFlashcard(Flashcard card) async {
    flashcards.add(card);
    await saveFlashcards();
  }

  static Future<void> saveFlashcards() async {
    final prefs = await SharedPreferences.getInstance();
    final data = flashcards.map((c) => jsonEncode(c.toJson())).toList();
    await prefs.setStringList('flashcards', data);
  }

  static Future<void> loadFlashcards() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('flashcards') ?? [];
    flashcards = data.map((item) => Flashcard.fromJson(jsonDecode(item))).toList();
  }

  static Future<void> updateQuizTimestamp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_quiz', DateTime.now().toIso8601String());
  }

  static Future<DateTime?> getLastQuizTimestamp() async {
    final prefs = await SharedPreferences.getInstance();
    final ts = prefs.getString('last_quiz');
    return ts != null ? DateTime.tryParse(ts) : null;
  }
}
