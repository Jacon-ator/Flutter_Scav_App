import 'package:flutter/material.dart';

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
              text: 'Contact me at: ',
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
