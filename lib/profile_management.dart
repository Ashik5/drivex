import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class ProfileManagement extends StatelessWidget {
  const ProfileManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Profile Management',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          customButtonWithIcon(
            "EDIT PROFILE",
            Icons.edit,
            Colors.orange,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfilePage()),
              );
            },
          ),
          customButtonWithIcon(
            "INFORMATION",
            Icons.info,
            Colors.green,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserInfoPage()),
              );
            },
          ),
          customButtonWithIcon(
            "SETTINGS",
            Icons.settings,
            Colors.purple,
            () {},
          ),
          customButtonWithIcon(
            "BILLING DETAILS",
            Icons.account_balance_wallet,
            Colors.blue,
            () {},
          ),
          SizedBox(
            height: 420,
          ),
          CustomLogoutButton("LOG OUT", () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, '/');
          }),
        ],
      ),
    );
  }

  Widget customButtonWithIcon(
      String text, IconData icon, Color iconColor, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? _image;

  // Reference to the Firebase collection
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  @override
  void initState() {
    super.initState();

    fetchAndDisplayUserData();
  }

  Future<void> fetchAndDisplayUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Fetch user data from Firebase
        DocumentSnapshot userSnapshot =
            await usersCollection.doc(user.uid).get();

        // Set the retrieved data in the text controllers
        nameController.text = userSnapshot['name'] ?? '';
        emailController.text = userSnapshot['email'] ?? '';
        mobileController.text = userSnapshot['mobile'] ?? '';
        birthdayController.text = userSnapshot['birthday'] ?? '';
        addressController.text = userSnapshot['address'] ?? '';

        // Retrieve and set the profile image in edit profile page
        /*dynamic profileImage = userSnapshot['profileImage'];
        if (profileImage is String) {
          setState(() {
            _image = File(profileImage);
          });
        }*/
      } catch (e) {
        // Handle any errors that might occur during data fetching
        print('Error fetching user data: $e');
      }
    }
  }

  Future<void> saveUserData() async {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user?.uid)
        .get();
    final userType = await userData["userType"];

    if (user != null) {
      String profileImageUrl = ''; // Initialize with empty string

      // If _image is not null, upload the image and get the download URL
      if (_image != null) {
        String fileName = 'profile_${user.uid}.jpg';
        Reference storageReference =
            FirebaseStorage.instance.ref().child('profile_images/$fileName');
        await storageReference.putFile(_image!);
        profileImageUrl = await storageReference.getDownloadURL();
      }

      // Save user data to Firebase including the profileImage field with the URL
      await usersCollection.doc(user.uid).set({
        'name': nameController.text,
        'email': emailController.text,
        'mobile': mobileController.text,
        'birthday': birthdayController.text,
        'address': addressController.text,
        'profileImage': profileImageUrl,
        'userType': userType, // Set the profile image URL
      });
    }
  }

  Future<void> _uploadImage() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null && _image != null) {
      // Create a unique filename for the image based on the user's UID
      String fileName = 'profile_${user.uid}.jpg';

      // Upload the image to Firebase Storage
      Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');
      await storageReference.putFile(_image!);

      // Get the download URL of the uploaded image
      String downloadURL = await storageReference.getDownloadURL();

      // Save the download URL to the user's profile in Firestore
      await usersCollection.doc(user.uid).update({'profileImage': downloadURL});
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _image == null ? const SizedBox.shrink() : Image.file(_image!),
              ElevatedButton(
                onPressed: _getImage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Upload Photo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('Name', nameController),
              _buildTextField('Email', emailController),
              _buildTextField('Mobile Number', mobileController),
              _buildDateTextField('Birthday', birthdayController, context),
              _buildTextField('Address', addressController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _uploadImage();
                  await saveUserData();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDateTextField(String labelText, TextEditingController controller,
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (selectedDate != null) {
                controller.text =
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
              }
            },
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomButton(this.title, this.onPressed, {super.key});

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

class CustomLogoutButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomLogoutButton(this.title, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Red color for logout button
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            //  Navigator.pushNamed(context, '/home');
          },
        ),
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                Map<String, dynamic> userData =
                    snapshot.data!.data() as Map<String, dynamic>;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 4,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              NetworkImage(userData['profileImage'] ?? ''),
                          //backgroundColor: Colors.grey[300],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildUserInfoTile(
                        Icons.person,
                        'Name',
                        userData['name'],
                      ),
                      _buildUserInfoTile(
                        Icons.email_outlined,
                        'Email',
                        userData['email'],
                      ),
                      _buildUserInfoTile(
                        Icons.phone,
                        'Mobile',
                        userData['mobile'],
                      ),
                      _buildUserInfoTile(
                        Icons.calendar_today,
                        'Birthday',
                        userData['birthday'],
                      ),
                      _buildUserInfoTile(
                        Icons.location_on,
                        'Address',
                        userData['address'],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
