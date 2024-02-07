import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:test_app/owner_end.dart';
import 'package:test_app/sign_up_page.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthPageState createState() => _AuthPageState();
}
class _AuthPageState extends State<AuthPage> {
  String userType = "user";
  Future<void> getUserType() async {
    try {
      // Get the document snapshot from Firestore
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
      await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Retrieve the 'userType' field
        setState(() {
          userType = documentSnapshot.data()?['userType'];
        });
        // Do something with the userType
        //print('User Type: $userType');
      } else {
        //print('Document does not exist');

      }
    } catch (e) {
      print('Error getting user type: $e');
    }
  }
  @override
  void initState() {
    getUserType();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(userType == 'owner')
              {
                return const Owner();
              }
            else {
              return const HomeScreen();
            }
          } else {
            return const SignUp();
          }
        },
      ),
    );
  }
}
