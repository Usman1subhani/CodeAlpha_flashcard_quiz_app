import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/flashcard_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

@override
void initState() {
  super.initState();
  _checkForNewCards();
}

Future<void> saveScore() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('last_score', score);
}


Future<void> _checkForNewCards() async {
  await FlashcardData.loadFlashcards();
  DateTime? lastQuiz = await FlashcardData.getLastQuizTimestamp();

  bool hasNew = true; // (We assume new cards for now — you can make this smarter later)

  if (hasNew && lastQuiz != null) {
    _showQuizPrompt();
  } else {
    setState(() {}); // Proceed directly
  }
}

void _showQuizPrompt() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text("New flashcards added!"),
      content: Text("Do you want to start a new quiz or continue from where you left?"),
      actions: [
        TextButton(
          onPressed: () {
            FlashcardData.updateQuizTimestamp(); // reset quiz timestamp
            Navigator.pop(context);
            setState(() {
              currentIndex = 0;
              score = 0;
            });
          },
          child: Text("Start Fresh"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            setState(() {}); // continue
          },
          child: Text("Continue"),
        ),
      ],
    ),
  );
}


void checkAnswer(bool correct) {
  if (cardKey.currentState?.isFront == false) {
    cardKey.currentState?.toggleCard(); // Flip back to question side
  }

  if (correct) score++;

  // Wait for flip animation to finish before changing the question
  Future.delayed(Duration(milliseconds: 300), () {
    setState(() {
      if (currentIndex < FlashcardData.flashcards.length - 1) {
        currentIndex++;
      } else {
        _showFinalScore();
      }
    });
  });
}

  void _showFinalScore() async {
  await saveScore(); // 🔥 Save score before showing dialog

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Quiz Complete'),
      content: Text('Your score: $score/${FlashcardData.flashcards.length}'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Text('OK'),
        )
      ],
    ),
  );
}


  

  @override
  Widget build(BuildContext context) {
    if (FlashcardData.flashcards.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: Center(child: Text('No flashcards found.')),
      );
    }

    final card = FlashcardData.flashcards[currentIndex];

    return Scaffold(
      appBar: AppBar(
  title: Text('Flashcard Quiz'),
  centerTitle: true,
  backgroundColor: Colors.indigo,
),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Question ${currentIndex + 1} of ${FlashcardData.flashcards.length}',
        style: TextStyle(fontSize: 20)),

    SizedBox(height: 30),

   LinearProgressIndicator(
  value: (currentIndex + 1) / FlashcardData.flashcards.length,
  backgroundColor: Colors.grey[300],
  color: Colors.indigo,
),
SizedBox(height: 16),


    // 🃏 Flashcard UI
    FlipCard(
      key: cardKey,
      flipOnTouch: false,
      front: _buildCard(card.question, isQuestion: true),
      back: _buildCard(card.answer, isQuestion: false),
    ),

    SizedBox(height: 30),

    ElevatedButton(
      onPressed: () => cardKey.currentState?.toggleCard(),
      child: Text('Show Answer'),
    ),

    SizedBox(height: 20),

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => checkAnswer(true),
          child: Text('Correct'),
        ),
        ElevatedButton(
          onPressed: () => checkAnswer(false),
          child: Text('Wrong'),
        ),
      ],
    ),

    SizedBox(height: 30),

    // ✅ Live score display
    Text(
  'Score: $score',
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.indigo),
),
    SizedBox(height: 30),
ElevatedButton.icon(
  onPressed: () {
    setState(() {
      currentIndex = 0;
      score = 0;
      cardKey = GlobalKey<FlipCardState>();
    });
  },
  icon: Icon(Icons.restart_alt),
  label: Text('Restart Quiz'),
  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
),


  ],
),

      ),
    );
  }

  Widget _buildCard(String text, {required bool isQuestion}) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
  gradient: LinearGradient(
    colors: isQuestion
        ? [Colors.white, Colors.blue.shade50]
        : [Colors.blue.shade50, Colors.indigo.shade100],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      blurRadius: 12,
      offset: Offset(0, 6),
    ),
  ],
),

      child: Center(
        child: Text(
  text,
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: isQuestion ? Colors.black87 : Colors.indigo.shade900,
  ),
)

      ),
    );
  }
}
