import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'profile_management.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final List<String> brands = <String>['bmw', 'audi', 'toyota', 'mercedes'];

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Josefin Sans',
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUp(),
        '/profile' : (context) => ProfileManagement(),
        '/signupDetails': (context) => const Details(),
        '/profile': (context) => ProfileManagement(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Column(children: [
                  Expanded(
                      child: Image.asset(
                        'assets/img/front-img.png',
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 330,
                    child: Text.rich(
                      TextSpan(text: 'Ultimate ', children: <TextSpan>[
                        TextSpan(
                            text: 'car rental ',
                            style: TextStyle(color: Color.fromRGBO(50, 132, 255, 1))),
                        TextSpan(
                          text: ' experience',
                        )
                      ]),
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 0.8,
                        fontWeight: FontWeight.normal,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: 350,
                    child: Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 14,
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(12, 37, 81, 1),
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Let’s get started',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ]),
              ),
            )));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              image: DecorationImage(
                  image: AssetImage('assets/img/home-top-bg.png'),
                  alignment: Alignment.bottomRight),
              color: Color.fromRGBO(50, 132, 255, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Row(
                    children: [
                      Text(
                        'Location',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            width: 24,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Dhaka , Bangladesh',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/notification-zero.svg',
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.8),
                          ),
                          cursorColor: Color.fromRGBO(0, 0, 0, 0.5),
                          autocorrect: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Color.fromRGBO(50, 132, 255, 1),
                            hintText: 'Search',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/filter-icon.svg',
                          width: 18,
                          color: const Color.fromRGBO(50, 132, 255, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Brands',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 132, 255, 1),
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                    itemBuilder: (BuildContext, index) {
                      return Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/brands/${brands[index]}.svg',
                              width: 70,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Popular car',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Color.fromRGBO(50, 132, 255, 1),
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CarCard('bmw', 'carModel', 'drivingStyle', 'fuel', 5, 4,
                    'image', 45),
                const CarCard('Benz', 'carModel', 'drivingStyle', 'fuel', 6,
                    4.5, 'image', 45),
                const CarCard('bmw', 'carModel', 'drivingStyle', 'fuel', 5, 4,
                    'image', 45),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class CarCard extends StatelessWidget {
  final String brandName;
  final String carModel;
  final String drivingStyle;
  final String fuel;
  final int seats;
  final double rating;
  final String image;
  final double price;
  const CarCard(this.brandName, this.carModel, this.drivingStyle, this.fuel,
      this.seats, this.rating, this.image, this.price,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(5, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/img/cars/car1.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //rating
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                            height: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$rating',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/heart-icon.svg',
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //brand name
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      brandName,
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                //hourly price
                Text.rich(
                  TextSpan(
                      text: '\$$price',
                      style: const TextStyle(fontSize: 20, color: Colors.blue),
                      children: const [
                        TextSpan(
                            text: '/hr', style: TextStyle(color: Colors.black)),
                      ]),
                ),
              ],
            ),
            const Divider(
              thickness: 1.5,
            ),
            //info section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/gear.svg',
                      height: 30,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      drivingStyle,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/pump.svg',
                      height: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      fuel,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/seat.svg',
                      height: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$seats seats',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});
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
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/nav/home.svg',
                height: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/nav/location.svg',
                height: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/nav/liked.svg',
                height: 30,
              )),
          IconButton(
              onPressed: () {},
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