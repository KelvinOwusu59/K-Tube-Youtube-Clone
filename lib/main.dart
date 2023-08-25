import 'package:flutter/material.dart';
import 'package:ktube/pages/shorts.dart';

import 'pages/history.dart';
import 'pages/home.dart';
import 'pages/subscriptions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Set your desired button color here
          // You can also adjust other properties like text styles, elevation, etc.
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    ShortsPage(),
    Subscriptions(),
    HistoryPage(),
  ];

  List<String> titles = [
    'Ktube',
    'Shorts',
    'Subscriptions',
    'History',
  ];

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black26;
    TextStyle style = const TextStyle(color: Colors.black, fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(
              Icons.play_circle_outline_outlined,
              color: Color.fromARGB(255, 83, 75, 114),
            ),
            Text(
              titles[_currentIndex],
              style: style,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: color,
            onPressed: () {
              // Implement search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.person_4_outlined),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: color,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: color,
            icon: Icon(Icons.short_text),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
              backgroundColor: color,
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Subscriptions'),
          BottomNavigationBarItem(
            backgroundColor: color,
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
