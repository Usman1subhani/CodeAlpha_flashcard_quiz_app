import 'package:flutter/material.dart';
import '../data/flashcard_data.dart';
import '../models/flashcard.dart';

class AddFlashcardScreen extends StatefulWidget {
  const AddFlashcardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        padding: EdgeInsets.all(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: questionController,
                decoration: InputDecoration(labelText: 'Question'),
              ),
              SizedBox(height: 16),
              TextField(
                maxLines: 3,
                controller: answerController,
                decoration: InputDecoration(labelText: 'Answer'),
              ),
              SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  onPressed: saveFlashcard,
                  label: Text('Save Flashcard'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
