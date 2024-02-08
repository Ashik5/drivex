import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/ChatPage.dart';
import 'dart:ui';

class Car extends StatefulWidget {
  const Car({super.key, required this.carId});
  final String carId;

  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  bool onFav = false;
  List images = [];
  String current_img = "";
  int imgCount = 0;
  void fav() async {
    final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('favourites')
        .doc(widget.carId)
        .get();
    setState(() {
      onFav = documentSnapshot.exists;
    });
  }

  void setFav() async {
    if (onFav) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('favourites')
          .doc(widget.carId)
          .delete();
      setState(() {
        onFav = false;
      });
    } else {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("favourites")
          .doc(widget.carId)
          .set({});
      setState(() {
        onFav = true;
      });
    }
  }

  void setImg() async {
    final images = await FirebaseStorage.instance
        .ref('images/cars/${widget.carId}')
        .listAll();
    for (var items in images.items) {
      String downloadURL = await items.getDownloadURL();
      setState(() {
        this.images.add(downloadURL);
      });
    }
    setState(() {
      current_img = this.images[0];
    });
  }

  void setCurrentImg(String url) {
    setState(() {
      current_img = url;
    });
  }

  @override
  void initState() {
    super.initState();
    fav();
    setImg();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Cars")
            .doc(widget.carId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.data() != null) {
            final carData = snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                              child:
                                  SvgPicture.asset('assets/icons/nav/back.svg'),
                            ),
                          ),
                        ),
                        const Text(
                          "Car Details",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setFav();
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
                                  child: onFav
                                      ? SvgPicture.asset(
                                          'assets/icons/heart-icon.svg',
                                          height: 50,
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/nav/love.svg'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
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
                                  child: SvgPicture.asset(
                                      'assets/icons/nav/share.svg'),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Image.network(
                      current_img,
                      height: 400,
                    ),
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var urls in images)
                            GestureDetector(
                              onTap: (() => {setCurrentImg(urls)}),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.network(
                                  urls,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    //rating and brand
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              "${carData['carType']}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(14, 122, 222, 1),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '4.5',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${carData['carModel']}",
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(color: Colors.blue),
                        ),
                        Text(
                          "Gallery",
                        ),
                        Text(
                          "Reviews",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Car Owner",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/avatar.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(carData['owner'])
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data!.data() != null) {
                                    final userData = snapshot.data!.data()
                                        as Map<String, dynamic>;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${userData['name']}"),
                                        const Text("owner")
                                      ],
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text("Error${snapshot.error}"),
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
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
                                  child:
                                      SvgPicture.asset('assets/icons/call.svg'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                        receiverUserId: carData['owner'],
                                        receiverName: "Drivex"),
                                  ),
                                );
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
                                  child:
                                      SvgPicture.asset('assets/icons/msg.svg'),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      height: 221,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(12, 37, 81, 1),
                                ),
                                width: 120,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/manual.svg',
                                      height: 35,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Manual",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "The car is a manually driven car",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(12, 37, 81, 1),
                                ),
                                width: 120,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/fuel.svg',
                                      height: 35,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Petrol",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "The car is a manually driven car",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(12, 37, 81, 1),
                                ),
                                width: 120,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/seat-fill.svg',
                                      height: 35,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "${carData['seats']} seats",
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "The car is a manually driven car",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BookingWidget("${carData['rate']}"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error${snapshot.error}"),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class BookingWidget extends StatelessWidget {
  final String pricePerHour;
  const BookingWidget(this.pricePerHour, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 0.5),
            blurRadius: 20,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text.rich(
            TextSpan(
              text: pricePerHour,
              style: const TextStyle(color: Colors.blue, fontSize: 20),
              children: const [
                TextSpan(text: "/hr", style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(150, 30)),
            onPressed: () {
              _showBottomSheet(context);
            },
            child: const Text(
              "Book Now",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 350,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'Book Your trip',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Pickup',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 22),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 120),
                  backgroundColor: const Color.fromRGBO(12, 32, 87, 1),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  _showBottomSheet2(context);
                },
                child: const Text(
                  'Procced',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void _showBottomSheet2(BuildContext context) {
  int hourValue = 5;
  int minuteValue = 45;

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 340,
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Select Date',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                          if (selectedDate != null) {}
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/icons/calendar.png',
                                  width: 35, height: 35),
                              SizedBox(width: 10),
                              Text(
                                'Selected Date',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Select Time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Container(
                  width: 338,
                  height: 75,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 160,
                          height: 75,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 160,
                                  height: 75,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFFFAFA),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 58,
                                top: 7,
                                child: SizedBox(
                                  width: 47,
                                  height: 9,
                                  child: Text(
                                    'HOUR',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 12,
                                      fontFamily: 'Josefin Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.60,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 71,
                                top: 30,
                                child: SizedBox(
                                  width: 18,
                                  height: 35,
                                  child: Text(
                                    hourValue.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 20,
                                      fontFamily: 'Josefin Sans',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                      letterSpacing: 1.60,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 8,
                                top: 33,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (hourValue > 1) hourValue--;
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/Minus.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 126,
                                top: 34,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (hourValue < 12) hourValue++;
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/icons/plus.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 178,
                        top: 0,
                        child: Container(
                          width: 160,
                          height: 75,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 160,
                                  height: 75,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFFFAFA),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 46,
                                top: 6,
                                child: SizedBox(
                                  width: 68,
                                  height: 10,
                                  child: Text(
                                    'MINUTE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 12,
                                      fontFamily: 'Josefin Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.60,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 61,
                                top: 29,
                                child: SizedBox(
                                  width: 39,
                                  height: 35,
                                  child: Text(
                                    minuteValue.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 28,
                                      fontFamily: 'Josefin Sans',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                      letterSpacing: 1.60,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 11,
                                top: 33,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (minuteValue > 1) minuteValue--;
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/Minus.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 126,
                                top: 34,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (minuteValue < 60) minuteValue++;
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/icons/plus.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 120),
                      backgroundColor: const Color.fromRGBO(12, 32, 87, 1),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                    child: const Text(
                      'Procced',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
