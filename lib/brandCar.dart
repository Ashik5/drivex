import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app/main.dart';

class BrandCar extends StatefulWidget {
  final String brand;
  const BrandCar({super.key, required this.brand});

  @override
  _BrandCarState createState() => _BrandCarState();
}

class _BrandCarState extends State<BrandCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.brand),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('Cars')
                  .where('carType', isEqualTo: widget.brand)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<String> items =
                    snapshot.data!.docs.map((doc) => doc.id).toList();
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
            ),
          ],
        ));
  }
}
