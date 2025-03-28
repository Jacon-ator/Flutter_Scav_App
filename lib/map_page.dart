import 'package:flutter/material.dart';

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
