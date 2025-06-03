import 'package:flutter/material.dart';
import '../data/flashcard_data.dart';
import '../models/flashcard.dart';

class AddFlashcardScreen extends StatefulWidget {
  const AddFlashcardScreen({super.key});

  @override
  _AddFlashcardScreenState createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcardScreen> {
  final questionController = TextEditingController();
  final answerController = TextEditingController();

void saveFlashcard() async {
  if (questionController.text.isNotEmpty &&
      answerController.text.isNotEmpty) {
    await FlashcardData.addFlashcard(
      Flashcard(
        question: questionController.text,
        answer: answerController.text,
      ),
    );
    Navigator.pop(context);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Flashcard')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: answerController,
              decoration: InputDecoration(labelText: 'Answer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveFlashcard,
              child: Text('Save Flashcard'),
            ),
          ],
        ),
      ),
    );
  }
}
