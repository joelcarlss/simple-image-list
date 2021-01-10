import 'package:ImageList/screens/photo_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home screen')),
        body: PhotoScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_alert_sharp), label: 'Alarmplus'),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), label: 'SnowFlake')
          ],
        ));
  }
}
