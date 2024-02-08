import 'package:flutter/material.dart';
import 'package:sawaratask/Screens/Individualmeetup.dart';

import '../Screens/home.dart';

class bottomnavigationbar extends StatefulWidget {
  const bottomnavigationbar({super.key});

  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar> {
  int _selectedIndex = 0;
  Widget currentscreen = Home();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: PageStorage(bucket: bucket, child: currentscreen),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentscreen = Home();
                  _selectedIndex = 0;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    color: _selectedIndex == 0 ? Colors.blue : null,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.blue : null,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.perm_identity,
                    color: _selectedIndex == 1 ? Colors.blue : null,
                  ),
                  Text(
                    'Prolet',
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue : null,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentscreen = Meetup();
                  _selectedIndex = 2;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.meeting_room,
                    color: _selectedIndex == 2 ? Colors.blue : null,
                  ),
                  Text(
                    'Meetup',
                    style: TextStyle(
                      color: _selectedIndex == 2 ? Colors.blue : null,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.explore,
                    color: _selectedIndex == 3 ? Colors.blue : null,
                  ),
                  Text(
                    'Explore',
                    style: TextStyle(
                      color: _selectedIndex == 3 ? Colors.blue : null,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 4;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: _selectedIndex == 4 ? Colors.blue : null,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: _selectedIndex == 4 ? Colors.blue : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
