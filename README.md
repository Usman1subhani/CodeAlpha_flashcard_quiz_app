# Flashcard Quiz App

A Flutter-based mobile application that allows users to create, manage, and take quizzes with flashcards. The app provides a smooth quiz-taking experience with progress tracking, live score saving, and the ability to restart quizzes.

---

## Branches

- **main**  
  Contains the stable, production-ready codebase of the Flashcard Quiz App.
  
- **dev**  
  Development branch where new features and improvements are integrated before merging into main.
  
- **feature/flashcard-management**  
  Implements functionalities related to adding, editing, and deleting flashcards.
  
- **feature/quiz-engine**  
  Implements the quiz interface, progress tracking, score calculation, and UI/UX enhancements.

---

## Purpose

The Flashcard Quiz App is designed to help users learn and memorize information effectively through flashcards and quizzes. It enables users to:

- Add and store flashcards with questions and answers.
- Take quizzes based on the flashcards.
- Track progress with a visual progress bar and percentage.
- Save quiz scores locally using SharedPreferences.
- Restart quizzes to improve learning outcomes.

---

## Features

- **Flashcard Management:** Add, edit, and save flashcards.
- **Quiz Interface:** Dynamic quiz with multiple-choice answers.
- **Progress Tracking:** Shows live progress (e.g., 3/10 or 30%).
- **Score Saving:** Persists scores locally using SharedPreferences.
- **Restart Quiz:** Option to restart the quiz anytime.
- **Clean & Responsive UI:** Modern Flutter design for an engaging user experience.

---

## Dependencies

- **flutter:** SDK for building the app.
- **shared_preferences:** To persist quiz scores and app settings locally.
- **provider (optional):** For state management if implemented.
- **cupertino_icons:** iOS style icons for a polished look.

You can check the complete list of dependencies in the [`pubspec.yaml`](pubspec.yaml) file.

---

## Installation and Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Usman1subhani/CodeAlpha_flashcard_quiz_app.git

2. **Navigate to the project directory:**

   ```bash
   cd flashcard_quiz_app

3. **Install dependencies:**

   ```bash
   flutter pub get

4. **Run the app on an emulator or physical device:**

   ```bash
   flutter run

## Project Structure
```
flashcard_quiz_app/
├── android/           # Android-specific files
├── ios/               # iOS-specific files
├── lib/               # Dart source code
│   ├── main.dart      # Entry point of the app
│   ├── models/         # Data models (e.g., Flashcard, Deck)
│   ├── screens/        # UI screens (e.g., HomeScreen, QuizScreen)
│   ├── widgets/       # Reusable UI components
│   ├── services/      # Services for data handling (e.g., API calls, database)
│   └── utils/          # Utility functions and helper classes
├── test/              # Unit and integration tests
├── .gitignore         # Specifies intentionally untracked files that Git should ignore
├── pubspec.yaml       # Flutter project configuration
├── README.md          # Project documentation
└── ...
```

## How to Contribute
1. Fork the repository.
2. Create a new branch for your feature or bugfix (git checkout -b feature/my-feature).
3. Make your changes and commit (git commit -m 'Add some feature').
4. Push to your branch (git push origin feature/my-feature).
5. Create a Pull Request.

## Screenshots

## Contact
Created by Usman Subhani.
Feel free to contact me for questions or collaboration.
     
