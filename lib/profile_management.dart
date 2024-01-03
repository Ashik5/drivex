import 'package:flutter/material.dart';
//profile management
class ProfileManagement extends StatelessWidget {
  const ProfileManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 852,
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
                left: 468,
                top: 648,
                child: Container(
                  width: 300,
                  height: 54,
                  decoration: ShapeDecoration(
                    color:
                    const Color(0xFF3284FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 10,
                        offset: Offset(0.50, 0.50),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 134,
                        height: 23,
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
                left: 0,
                top: 25,
                child: Container(
                  width: 390,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            shadows: const [
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
                              Transform(
                                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: const Stack(children: [

                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 100),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.90,
                        ),
                      ),
                      const SizedBox(width: 100),
                      Transform(
                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                            shadows: const [
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
                              Transform(
                                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: const Stack(children: [

                                      ])
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
                left: 125,
                top: 286,
                child: Container(
                  width: 141,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0D7ADE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Edit Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 141,
                top: 218,
                child: SizedBox(
                  width: 110,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 110,
                        height: 24,
                        child: Text(
                          'Jhon Doe',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Josefin Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '@johndoe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.699999988079071),
                          fontSize: 12,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 143,
                top: 95,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 106,
                      height: 106,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF3284FF),
                        shape: OvalBorder(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/100x100"),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 1.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 42,
                top: 422,
                child: SizedBox(
                  width: 307,
                  height: 153,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 298,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform(
                                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                        shadows: const [
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
                                          Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                            child: Container(
                                              width: 15,
                                              height: 15,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(),
                                              child: const Stack(children: [

                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const SizedBox(
                                    width: 62,
                                    height: 20,
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: 0.70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 48),
                            Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 20,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform(
                                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Stack(children: [

                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: 298,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform(
                                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                        shadows: const [
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
                                          Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                            child: Container(
                                              width: 15,
                                              height: 15,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(),
                                              child: const Stack(children: [

                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const SizedBox(
                                    width: 104,
                                    height: 20,
                                    child: Text(
                                      'Billing Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: 0.70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 48),
                            Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 20,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform(
                                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Stack(children: [

                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: 298,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform(
                                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                        shadows: const [
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
                                          Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                            child: Container(
                                              width: 15,
                                              height: 15,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(),
                                              child: const Stack(children: [

                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const SizedBox(
                                    width: 90,
                                    height: 20,
                                    child: Text(
                                      'Information',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: 0.70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 48),
                            Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 20,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform(
                                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Stack(children: [

                                            ])
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: 298,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform(
                                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                        shadows: const [
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
                                          Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                            child: Container(
                                              width: 15,
                                              height: 15,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(),
                                              child: const Stack(children: [

                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const SizedBox(
                                    width: 90,
                                    height: 20,
                                    child: Text(
                                      'Log out',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Josefin Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: 0.70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 48),
                            Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 20,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform(
                                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Stack(children: [

                                            ]),
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
                  ),
                ),
              ),
              Positioned(
                left: 134,
                top: 694,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Joined at',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.699999988079071),
                          fontSize: 12,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.60,
                        ),
                      ),
                      const TextSpan(
                        text: ' 20.12.2003',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class ProfileManage extends StatelessWidget {
  const ProfileManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
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
                left: 468,
                top: 648,
                child: Container(
                  width: 300,
                  height: 55,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3284FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 10,
                        offset: Offset(0.50, 0.50),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Column(
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
                left: 0,
                top: 25,
                child: Container(
                  width: 390,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            shadows: const [
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
                              Transform(
                                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: const Stack(children: [

                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 100),
                      const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.90,
                        ),
                      ),
                      const SizedBox(width: 100),
                      Transform(
                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                            shadows: const [
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
                              Transform(
                                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: const Stack(children: [

                                      ]),
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
                left: 144,
                top: 110,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 106,
                      height: 106,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF0C2551),
                        shape: OvalBorder(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/100x100"),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 1.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 225,
                top: 183,
                child: Container(
                  width: 25,
                  padding: const EdgeInsets.symmetric(horizontal: 3.91, vertical: 7.81),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0C2551),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(39.06),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 9.38,
                        height: 9.38,
                        child: Stack(children: [

                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 261,
                child: SizedBox(
                  width: 333,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 57,
                            height: 20,
                            child: Text(
                              'Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0C2551),
                                fontSize: 16,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 333,
                            height: 43,
                            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0x0C3284FF),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Colors.white.withOpacity(0.10000000149011612),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jhon Doe',
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
                      const SizedBox(height: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 116,
                            height: 20,
                            child: Text(
                              'Email Address',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0C2551),
                                fontSize: 16,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 333,
                            height: 43,
                            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0x0C3284FF),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Colors.white.withOpacity(0.10000000149011612),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tanjir.cse.20220104024@aust.edu',
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
                      const SizedBox(height: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 128,
                            height: 20,
                            child: Text(
                              'Mobile number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0C2551),
                                fontSize: 16,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 333,
                            height: 43,
                            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0x0C3284FF),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Colors.white.withOpacity(0.10000000149011612),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '01712345678',
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
                      const SizedBox(height: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 80,
                            height: 20,
                            child: Text(
                              'Username',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0C2551),
                                fontSize: 16,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 333,
                            height: 43,
                            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0x0C3284FF),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Colors.white.withOpacity(0.10000000149011612),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '@jhonedoe',
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
                      const SizedBox(height: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 87,
                            height: 20,
                            child: Text(
                              'Birth Date',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0C2551),
                                fontSize: 16,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 333,
                            height: 43,
                            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0x0C3284FF),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Colors.white.withOpacity(0.10000000149011612),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '02.08.2001',
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 739,
                child: SizedBox(
                  width: 333,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Joined at',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.699999988079071),
                                fontSize: 12,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.60,
                              ),
                            ),
                            const TextSpan(
                              text: ' 20.12.2003',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.60,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 113),
                      Container(
                        width: 99,
                        height: 34,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF7171),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 20,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Log Out',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.60,
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
      ],
    );
  }
}