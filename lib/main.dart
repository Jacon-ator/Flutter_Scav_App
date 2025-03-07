import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scavanger Hunt!',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HuntPage(),
    MapPage(),
    HelpPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual PFT Tour'),
        backgroundColor: Colors.purple[400],
        centerTitle: true,
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.egg),
            label: 'Scavanger Hunt',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline_sharp),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Map of PFT', style: TextStyle(fontSize: 24)),
            Text('First Floor',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Image.asset('assets/PFT_First_Floor.jpg'),
            Text('Second Floor',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Image.asset('assets/PFT_Second_Floor.jpg'),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String funFact;
  final String questionText;
  final String answer;

  Question({
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
  final TextEditingController _answerController = TextEditingController();
  String feedback = "";

  final List<Question> questions = [
    Question(
      funFact: "Test Question 1",
      questionText: "Write 'blue' ?",
      answer: "blue",
    ),
    Question(
      funFact: "Test Question 2",
      questionText: "Write 'yellow'",
      answer: "yellow",
    ),
  ];

  void checkAnswer() {
    String userAnswer = _answerController.text.trim().toLowerCase();
    String correctAnswer = questions[currentQuestionIndex].answer.toLowerCase();

    if (userAnswer == correctAnswer) {
      setState(() {
        feedback = "Correct!";

        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          _answerController.clear();
        } else {
          feedback = "Congratulations! You completed the scavenger hunt.";
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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: isCompleted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You've completed the scavenger hunt!",
                      style: TextStyle(fontSize: 24)),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Question ${currentQuestionIndex + 1}",
                      style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Text(questions[currentQuestionIndex].funFact,
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text(questions[currentQuestionIndex].questionText,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                            : Colors.red),
                  ),
                ],
              ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 20),
          Text('Virtual Tour Guide', style: TextStyle(fontSize: 24)),
          SizedBox(height: 10),
          Text('Joe Smoe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('Have Questions or Need Help?', style: TextStyle(fontSize: 18)),
          SizedBox(height: 4),
          Text.rich(
            TextSpan(
              text: 'Contact me at:',
              style: TextStyle(fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                  text: 'JoeSmoe@lsu.edu',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
