import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scavanger Hunt!',
      theme: ThemeData(fontFamily: 'Proxima Nova'),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const UserIdSplashScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF461D7C),
      body: Center(
        child: Image.asset(
          'assets/LSU_Logo.png',
          width: 200,
        ),
      ),
    );
  }
}

class UserIdSplashScreen extends StatefulWidget {
  const UserIdSplashScreen({super.key});

  @override
  _UserIdSplashScreenState createState() => _UserIdSplashScreenState();
}

class _UserIdSplashScreenState extends State<UserIdSplashScreen> {
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF461D7C),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter User ID',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _userIdController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: 'User ID',
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(
                          userId: _userIdController.text.isNotEmpty
                              ? _userIdController.text
                              : "DefaultUserId"),
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Modify HomeScreen to accept a userId ---
class HomeScreen extends StatefulWidget {
  final String userId;
  const HomeScreen({super.key, required this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    MapPage(),
    HuntPage(),
    HelpPage(),
  ];

  // Returns a non-null title based on the selected index.
  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return "Map";
      case 1:
        return "Question";
      case 2:
        return "Help";
      default:
        return ""; // Always returns a non-null String
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          _getTitle(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF461D7C),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer header with the userid
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF461D7C),
              ),
              accountName:
                  const Text('User ID:', style: const TextStyle(fontSize: 20)),
              accountEmail:
                  Text(widget.userId, style: const TextStyle(fontSize: 18)),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Color(0xFF461D7C),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Account Settings'),
              onTap: () {
                // Handle account settings tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notification Preferences'),
              onTap: () {
                // Handle notification preferences tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Privacy'),
              onTap: () {
                // Handle privacy tap
              },
            ),
          ],
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 40, // Base size for icons
        selectedIconTheme:
            const IconThemeData(size: 50), // Size for selected icon
        unselectedIconTheme:
            const IconThemeData(size: 40), // Size for unselected icons
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Map_Icon.png')),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Question_Icon.png')),
            label: 'Question',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Help_Icon.png')),
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
  final String title; // New custom title field
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
  bool isStarted = false; // Tracks whether the hunt has started
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
          // Increment to mark completion
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

    // Show welcome screen if hunt hasn't started
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

    // Show completion message if all questions are answered
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

    // Display the current question using the custom title
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom header for each question
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
