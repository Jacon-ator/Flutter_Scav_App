import 'package:flutter/material.dart';
import 'home_screen.dart';

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
