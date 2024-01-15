import 'package:flutter/material.dart';

class ProfileManagement extends StatelessWidget {
  const ProfileManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: const []),
      ),
    );
  }
}
