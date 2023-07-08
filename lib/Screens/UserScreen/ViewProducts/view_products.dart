import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripdash/widget/ViewPackages/package_container.dart';
import 'package:tripdash/widget/ViewPackages/package_gesture_detector.dart';

class ViewProducts extends StatefulWidget {
  static const routeName = '/ViewProducts';
  const ViewProducts({Key? key}) : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection('product');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:  Text('Pre-Designed Packages',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.green),),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 8),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Pre-Designed Packages",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _productCollection
                      .where("category", isEqualTo: "fix")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<QueryDocumentSnapshot> documents =
                          snapshot.data!.docs;

                      return Row(
                        children: documents.map((doc) {
                          final data = doc.data() as Map<String,
                              dynamic>; // Cast to Map<String, dynamic>
                          final name = data['productName'] ?? '';
                          final location = data['location'] ?? '';
                          final people = data['people'] ?? '';
                          final price = data['price'] ?? '';
                          final rating = data['rating'] ?? '';
                          final imageUrl = data['imageUrl'] ?? '';

                          return PackagaeGestureDetector(
                            name: name,
                            location: location,
                            people: people,
                            price: price,
                            rating: rating,
                            imageUrl: imageUrl,
                          );
                        }).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 16,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Customizeable Packages",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 16,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _productCollection
                      .where("category", isEqualTo: "cus")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<QueryDocumentSnapshot> documents =
                          snapshot.data!.docs;

                      return Column(
                        children: documents.map((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          final name = data['productName'] ?? '';
                          final location = data['location'] ?? '';
                          final people = data['people'] ?? '';
                          final price = data['price'] ?? '';
                          final rating = data['rating'] ?? '';
                          final imageUrl = data['imageUrl'] ?? '';

                          return PackageContainer(
                            name: name,
                            location: location,
                            people: people,
                            price: price,
                            rating: rating,
                            imageUrl: imageUrl,
                          );
                        }).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
