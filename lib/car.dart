import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Car extends StatelessWidget {
  const Car({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: SvgPicture.asset('assets/icons/nav/back.svg'),
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
                          child: SvgPicture.asset('assets/icons/nav/love.svg'),
                        ),
                      ),
                    ),
                    SizedBox(
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
                          child: SvgPicture.asset('assets/icons/nav/share.svg'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Image.asset(
              'assets/img/cars/car1.png',
              width: 500,
            ),
            Container(
              width: 350,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/img/cars/car1.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(102, 163, 255, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      '+10',
                      style: TextStyle(color: Colors.white),
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "Sedan",
                      style: TextStyle(
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Audi R8",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(),
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
                  "Rent partener",
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Jhon Doe"), Text("owner")],
                    ),
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
                          child: SvgPicture.asset('assets/icons/call.svg'),
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
                          child: SvgPicture.asset('assets/icons/msg.svg'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(12, 37, 81, 1),
                  ),
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(12, 37, 81, 1),
                  ),
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(12, 37, 81, 1),
                  ),
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                      const Text(
                        "5 seats",
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
            )
          ],
        ),
      ),
      bottomNavigationBar: const BookingWidget(),
    );
  }
}

class BookingWidget extends StatelessWidget {
  const BookingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 0.5),
            blurRadius: 20,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text.rich(
            TextSpan(
              text: "\$40",
              style: TextStyle(color: Colors.blue, fontSize: 20),
              children: [
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
            onPressed: () {},
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
