import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileManagement extends StatelessWidget {
  const ProfileManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Management'),
      ),
      body: ListView(
        children: [
          BackButtonWidget(),
          CustomButton("EDIT PROFILE", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditProfilePage()),
            );
          }),
          CustomButton("INFORMATION", () {
            // Add information functionality here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserInfoPage()),
            );
          }),
          CustomButton("SETTINGS", () {
            // Add settings functionality here
          }),
          CustomButton("BILLING DETAILS", () {
            // Add billing details functionality here
          }),
          CustomLogoutButton("LOG OUT", () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, '/');
          }),
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
    // Fetch and display user data when the page loads
    fetchAndDisplayUserData();
  }

  Future<void> fetchAndDisplayUserData() async {
    // Get the current user
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
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image display
              _image == null ? const SizedBox.shrink() : Image.file(_image!),
              // Upload Image button
              ElevatedButton(
                onPressed: _getImage,
                child: const Text('Upload Photo'),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
              ),
              TextField(
                controller: birthdayController,
                decoration: InputDecoration(
                  labelText: 'Birthday',
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
                        birthdayController.text =
                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                      }
                    },
                  ),
                ),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await _uploadImage();
                  await saveUserData();
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
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
      ),
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          NetworkImage(userData['profileImage'] ?? ''),
                      backgroundColor: Colors.grey[300],
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Name'),
                      subtitle: Text(userData['name']),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email_outlined),
                      title: const Text('Email'),
                      subtitle: Text(userData['email']),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Mobile'),
                      subtitle: Text(userData['mobile']),
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text('Birthday'),
                      subtitle: Text(userData['birthday']),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text('Address'),
                      subtitle: Text(userData['address']),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
