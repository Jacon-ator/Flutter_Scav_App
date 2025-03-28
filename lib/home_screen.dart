import 'package:flutter/material.dart';
import 'map_page.dart';
import 'hunt_page.dart';
import 'help_page.dart';

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

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return "Map";
      case 1:
        return "Question";
      case 2:
        return "Help";
      default:
        return "";
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
        iconSize: 30,
        selectedIconTheme: const IconThemeData(size: 50),
        unselectedIconTheme: const IconThemeData(size: 30),
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
