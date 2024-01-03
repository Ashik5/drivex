import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class CarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 10,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 58,
                top: 323,
                child: Container(
                  width: 260,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x0C000000),
                              blurRadius: 20,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sedan',
                              style: TextStyle(
                                color: Color(0xFF0D7ADE),
                                fontSize: 10,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 217),
                      Container(
                        height: 16,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(children: [

                                  ]),
                            ),
                            const SizedBox(width: 6),
                            SizedBox(
                              width: 20,
                              height: 8,
                              child: Text(
                                '4.5',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'Josefin Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '9:41',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 18,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 227),
                      Container(
                        height: 24,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 14,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(width: 4.48),
                                  const SizedBox(width: 4.48),
                                  const SizedBox(width: 4.48),
                                ],
                              ),
                            ),
                            const SizedBox(width: 3),
                            Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(children: [

                                  ]),
                            ),
                            const SizedBox(width: 3),
                            Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                              child: Container(
                                width: 23.04,
                                height: 13,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(children: [

                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 65,
                child: Container(
                  width: 334,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform(
                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 20,
                                offset: Offset(0, 0.50),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 222),
                      Text(
                        'Car Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 222),
                      Container(
                        height: 27.08,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x0C000000),
                                    blurRadius: 20,
                                    offset: Offset(0, 0.50),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            Container(
                              padding: const EdgeInsets.all(8),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x0C000000),
                                    blurRadius: 20,
                                    offset: Offset(0, 0.50),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 84,
                top: 248,
                child: Container(
                  width: 208,
                  padding: const EdgeInsets.all(3),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 20,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEDEDED),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 45.03,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/80x45"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        width: 30,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEDEDED),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 45.03,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/80x45"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        width: 30,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEDEDED),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 45.03,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/80x45"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        width: 30,
                        padding: const EdgeInsets.only(right: 2),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEDEDED),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 45.03,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/80x45"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        width: 30,
                        padding: const EdgeInsets.only(right: 7),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEDEDED),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 45.03,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/80x45"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        width: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFF66A3FF),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '+10',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 372,
                child: SizedBox(
                  width: 77,
                  height: 13,
                  child: Text(
                    'Audi R8',
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 20,
                      fontFamily: 'Josefin Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 63,
                top: 118,
                child: Container(
                  width: 250,
                  height: 112.03,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/250x112"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 431,
                child: Container(
                  width: 288,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'About',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 45),
                      Text(
                        'Gallery',
                        style: TextStyle(
                          color: Color(0xFF4C4C4C),
                          fontSize: 12,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 45),
                      Text(
                        'Reviews',
                        style: TextStyle(
                          color: Color(0xFF4C4C4C),
                          fontSize: 12,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 470,
                child: Text(
                  'Rent partner',
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 14,
                    fontFamily: 'Josefin Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 587,
                child: Text(
                  'Specification',
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 14,
                    fontFamily: 'Josefin Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 510,
                child: Container(
                  width: 288,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/50x50"),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(),
                              ),
                            ),
                            const SizedBox(width: 70),
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 67,
                                    height: 14,
                                    child: Text(
                                      'Jhone Doe',
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 14,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 9),
                                  SizedBox(
                                    width: 37,
                                    height: 12,
                                    child: Text(
                                      'Owner',
                                      style: TextStyle(
                                        color: Color(0xFF585858),
                                        fontSize: 12,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 70),
                      Container(
                        height: 33.89,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x0C000000),
                                    blurRadius: 20,
                                    offset: Offset(0, 0.50),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                ],
                              ),
                            ),
                            const SizedBox(width: 34),
                            Container(
                              padding: const EdgeInsets.all(8),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x0C000000),
                                    blurRadius: 20,
                                    offset: Offset(0, 0.50),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 609,
                child: Container(
                  width: 287,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 72.75,
                              height: 142,
                              decoration: ShapeDecoration(
                                color: Color(0xFF0C2551),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 113.60,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(),
                                    child: Stack(children: [

                                        ]),
                                  ),
                                  const SizedBox(height: 11),
                                  Text(
                                    'Manul',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Josefin Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 11),
                                  SizedBox(
                                    width: 59,
                                    child: Text(
                                      'The car is a manually driven car ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFCDE0FD),
                                        fontSize: 10,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 42),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 72.75,
                              height: 142,
                              decoration: ShapeDecoration(
                                color: Color(0xFF0C2551),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 113.60,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(),
                                    child: Stack(children: [

                                        ]),
                                  ),
                                  const SizedBox(height: 11),
                                  Text(
                                    'Petrol',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Josefin Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 11),
                                  SizedBox(
                                    width: 59,
                                    child: Text(
                                      'This car is petrol driven car',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFCDE0FD),
                                        fontSize: 10,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 42),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 72.75,
                              height: 142,
                              decoration: ShapeDecoration(
                                color: Color(0xFF0C2551),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 113.60,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            child: Stack(children: [

                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 11),
                                  Text(
                                    'Petrol',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Josefin Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 11),
                                  SizedBox(
                                    width: 59,
                                    child: Text(
                                      'This car is petrol driven car',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFCDE0FD),
                                        fontSize: 10,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 744,
                child: Container(
                  width: 375,
                  padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 21),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 20,
                        offset: Offset(0, -1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 56,
                                height: 16,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$40',
                                        style: TextStyle(
                                          color: Color(0xFF0D7ADE),
                                          fontSize: 18,
                                          fontFamily: 'Josefin Sans',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/hr',
                                        style: TextStyle(
                                          color: Color(0xFF909090),
                                          fontSize: 18,
                                          fontFamily: 'Josefin Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 116),
                              Container(
                                height: 28,
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                decoration: ShapeDecoration(
                                  color: Color(0xFF66A3FF),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Book Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1,
                top: 577,
                child: Container(
                  width: 373,
                  height: 234,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 460,
                        top: 648,
                        child: Container(
                          width: 300,
                          height: 55,
                          decoration: ShapeDecoration(
                            color: Color(0xFF3284FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 10,
                                offset: Offset(0.50, 0.50),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 134,
                                height: 22,
                                child: Text(
                                  'Create an Account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Josefin Sans',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: 0.70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 97,
                        top: 20,
                        child: SizedBox(
                          width: 180,
                          height: 25,
                          child: Text(
                            'Book your trip',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Josefin Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: 1.25,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21,
                        top: 64,
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 333,
                                      height: 43,
                                      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Color(0x0C3284FF),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1.50,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: Colors.white.withOpacity(0.10000000149011612),
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 18,
                                            height: 16.58,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/18x17"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Pickup ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(0.6499999761581421),
                                              fontSize: 15,
                                              fontFamily: 'Josefin Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                              letterSpacing: 0.75,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 333,
                                      height: 43,
                                      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Color(0x0C3284FF),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1.50,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: Colors.white.withOpacity(0.10000000149011612),
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 18,
                                            height: 16.58,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/18x17"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          SizedBox(
                                            width: 86,
                                            height: 15,
                                            child: Text(
                                              'Destination',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.6499999761581421),
                                                fontSize: 15,
                                                fontFamily: 'Josefin Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                letterSpacing: 0.75,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 182,
                        child: Container(
                          width: 292,
                          height: 43,
                          decoration: ShapeDecoration(
                            color: Color(0xFF0C2551),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 10,
                                offset: Offset(0.50, 0.50),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 159,
                                height: 17,
                                child: Text(
                                  'Proceed!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Josefin Sans',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: 0.90,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}