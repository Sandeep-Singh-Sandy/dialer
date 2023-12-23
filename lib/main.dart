import 'package:dialer/dialPad.dart';
import 'package:flutter/material.dart';

import './callLogs.dart';

void main() {
  runApp(MainApp());
  getCallLogs();
}

class MainApp extends StatefulWidget {
  @override
  State createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[Logs()];
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.voicemail),
            label: 'Voicemail',
          ),
        ],
        currentIndex: _selectedIndex, onTap: _onItemTapped, //New
      ),
    ));
  }
}
