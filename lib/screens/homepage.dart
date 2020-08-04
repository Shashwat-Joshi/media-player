import 'package:flutter/material.dart';
import 'streamMusic.dart';
import 'package:intl/intl.dart';
import '../data/userData.dart';
import 'assets.dart';
import 'videoStream.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String currentTime;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    StreamMusic(),
    VideoStream(),
    Assets(),
  ];

  @override
  void initState() {
    super.initState();
    currentTime = (DateFormat.jm().format(DateTime.now())).toString();
    // currentTime = "8:00 PM";
    print(currentTime);
    setGreetingMessage();
  }

  setGreetingMessage() {
    if (currentTime[currentTime.length - 2] == "A") {
      greetingMessage = "Good morning";
    } else {
      if ((currentTime.length == 7 && int.parse(currentTime[0]) <= 5) ||
          currentTime.substring(0, 2) == "12") {
        greetingMessage = "Good afternoon";
      } else {
        greetingMessage = "Good evening";
      }
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi_tethering),
            title: Text('Stream'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_video),
            title: Text('Video Stream'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            title: Text('Assets'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
        elevation: 10.0,
        unselectedItemColor: Colors.white70,
      ),
    );
  }
}
