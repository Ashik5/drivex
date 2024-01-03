import 'package:flutter/material.dart';

void main() {
  runApp(ProfileManagement());
}

class ProfileManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileManagements(),
    );
  }
}

// ... (rest of the code remains the same)




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileManagements(),
    );
  }
}

class ProfileManagements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Managements'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomButton("EDIT PROFILE", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage()),
            );
          }),
          CustomButton("SETTINGS", () {
            // Add settings functionality here
          }),
          CustomButton("BILLING DETAILS", () {
            // Add billing details functionality here
          }),
          CustomButton("INFORMATION", () {
            // Add information functionality here
          }),
          CustomButton("LOG OUT", () {
            // Add log out functionality here
          }),
        ],
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            TextField(
              controller: birthdayController,
              decoration: InputDecoration(labelText: 'Birthday'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to save user data here
                Navigator.pop(context); // Go back to the home page
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomButton(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
