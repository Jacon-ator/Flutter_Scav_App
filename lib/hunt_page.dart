import 'package:flutter/material.dart';

class Question {
  final String title;
  final String funFact;
  final String questionText;
  final String answer;

  Question({
    required this.title,
    required this.funFact,
    required this.questionText,
    required this.answer,
  });
}

class HuntPage extends StatefulWidget {
  const HuntPage({super.key});

  @override
  _HuntPageState createState() => _HuntPageState();
}

class _HuntPageState extends State<HuntPage> {
  int currentQuestionIndex = 0;
  bool isStarted = false;
  final TextEditingController _answerController = TextEditingController();
  String feedback = "";

  final List<Question> questions = [
    Question(
      title: "Capstone Gallery",
      funFact:
          "The Capstone Gallery is one of the favorite study spots for most students.",
      questionText: "How many steps does it take to walk up the large stairs?",
      answer: "35",
    ),
    Question(
      title: "Cambre Atrium",
      funFact: "The Cambre Atrium is another common study spot for students!",
      questionText: "How many chairs are at each table?",
      answer: "8",
    ),
    Question(
      title: "Panera Bread",
      funFact:
          "The Panera Bread is the one stop shop for all of your food needs while studying hard!",
      questionText: "What is the price for a bowl of tomato soup?",
      answer: "4.99",
    ),
  ];

  void checkAnswer() {
    String userAnswer = _answerController.text.trim().toLowerCase();
    String correctAnswer = questions[currentQuestionIndex].answer.toLowerCase();

    if (userAnswer == correctAnswer) {
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          feedback = "Correct!";
          currentQuestionIndex++;
          _answerController.clear();
        } else {
          feedback = "Congratulations! You completed the scavenger hunt.";
          currentQuestionIndex++;
        }
      });
    } else {
      setState(() {
        feedback = "Incorrect, try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isCompleted = currentQuestionIndex >= questions.length;

    if (!isStarted) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start your tour at the Capstone Gallery!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isStarted = true;
                  });
                },
                child: Text("Start"),
              ),
            ],
          ),
        ),
      );
    }

    if (isCompleted) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "You've completed the scavenger hunt! You now are an expert on PFT! Have a nice day!",
                  style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex].title,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex].funFact,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Answer',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAnswer,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Text(
              feedback,
              style: TextStyle(
                fontSize: 18,
                color: feedback == "Correct!" ||
                        feedback.contains("Congratulations")
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
