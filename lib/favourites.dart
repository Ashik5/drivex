import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/main.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                              offset: Offset(0, 0.5),
                              blurRadius: 20,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: SvgPicture.asset('assets/icons/nav/back.svg'),
                        ),
                      ),
                    ),
                    const Text(
                      "Favourites",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const FavouriteCollection(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const FavouritesCustomNavigationBar(),
    );
  }
}

class FavouritesCustomNavigationBar extends StatelessWidget {
  const FavouritesCustomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(15, 0, 0, 0),
              offset: Offset(0, 2),
              blurRadius: 10),
        ],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
          bottom: Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: SvgPicture.asset(
                'assets/icons/nav/home.svg',
                height: 30,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/favourites');
              },
              icon: SvgPicture.asset(
                'assets/icons/nav/liked-selected.svg',
                height: 30,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ChatPage');
              },
              icon: SvgPicture.asset(
                'assets/icons/nav/chat.svg',
                height: 30,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: SvgPicture.asset(
                'assets/icons/nav/user.svg',
                height: 30,
              ))
        ],
      ),
    );
  }
}

class FavouriteCollection extends StatelessWidget {
  const FavouriteCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("favourites")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<String> items = snapshot.data!.docs.map((doc) => doc.id).toList();
        if (items.isEmpty) {
          return const Center(
            child: Text('No items found in the collection.'),
          );
        } else {
          return Column(
            children: [
              for (String carId in items)
                Column(children: [
                  CarCard('${carId}'),
                  const SizedBox(
                    height: 20,
                  ),
                ])
            ],
          );
        }
      },
    );
  }
}
