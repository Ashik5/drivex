import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Owner extends StatefulWidget {
  const Owner({super.key});

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  Future<void> _launchFacebookURL() async {
    const facebookURL = 'https://www.facebook.com/mdtanjir.rahman/';
    if (await canLaunch(facebookURL)) {
      await launch(facebookURL);
    } else {
      throw 'Could not launch $facebookURL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 50),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topRight,
                      fit: BoxFit.scaleDown,
                      scale: 1.5,
                      image: AssetImage('assets/img/patterns/pattern1.png'))),
              height: 200,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    "Owner's End",
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Get your cars ready!',
                    style: GoogleFonts.playfairDisplay(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //actual form
            SizedBox(
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //submit button
                  SizedBox(
                    width: 280,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/addCar');
                      },
                      child: const Text(
                        'ADD CAR',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: 280,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/inbox');
                      },
                      child: const Text(
                        'CHAT WITH USERS',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Care joining FB Community?'),
                      TextButton(
                          onPressed: () {
                            _launchFacebookURL();
                            //Navigator.pushNamed(context, '/home');
                          },
                          child: const Text(
                            'Click',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: const OwnerCustomNavigationBar(),
    );
  }
}

class OwnerCustomNavigationBar extends StatelessWidget {
  const OwnerCustomNavigationBar({super.key});
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
                Navigator.pushNamed(context, '/owner');
              },
              icon: SvgPicture.asset(
                'assets/icons/nav/home.svg',
                height: 30,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inbox');
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
