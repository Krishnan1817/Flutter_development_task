import 'package:flutter/material.dart';
import 'package:sawaratask/Screens/Individualmeetup.dart';
import 'package:sawaratask/Login.dart';
import 'package:sawaratask/bottomnavbar/bottomappbar.dart';

import 'Screens/Description.dart';

void main() {
  runApp(NewProject());
}

class NewProject extends StatelessWidget {
  const NewProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
