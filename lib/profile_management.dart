import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileManagement());
}

class ProfileManagement extends StatelessWidget {
  const ProfileManagement({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
        fontFamily: 'Montserrat',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Management'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomButton("EDIT PROFILE", Icons.edit, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditProfilePage()),
            );
          }),
          CustomButton("SETTINGS", Icons.settings, () {
            // Add settings functionality here
          }),
          CustomButton("BILLING DETAILS", Icons.credit_card, () {
            // Add billing details functionality here
          }),
          CustomButton("INFORMATION", Icons.info, () {
            // Add information functionality here
          }),
          CustomButton("LOG OUT", Icons.logout, () {
            // Add log out functionality here
          }),
        ],
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key});

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
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField("Name", Icons.person, nameController),
            _buildTextField("Email", Icons.email, emailController),
            _buildTextField("Mobile Number", Icons.phone, mobileController),
            _buildTextField("Birthday", Icons.cake, birthdayController),
            _buildTextField("Address", Icons.location_on, addressController),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to save user data here
                Navigator.pop(context); // Go back to the home page
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo, // Set the desired color directly
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, IconData icon, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          icon: Icon(icon, color: Colors.indigo), // Set the desired color directly
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton(this.title, this.icon, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo, // Set the desired color directly
        ),
      ),
    );
  }
}
