import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCX9W_kYbdvulFvYbS1xU_SO4Lt083ryk8",
          appId: "1:478669367974:android:f711fcb3a1b169baa46267",
          messagingSenderId: "478669367974",
          projectId: "latest01-2b8fa"));
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: 'tanjir@gmail.com', password: '12345678');
          },
          child: const Text('press'),
        ),
      ),
    );
  }
}