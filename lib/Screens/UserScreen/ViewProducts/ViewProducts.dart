import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/app_bar.dart';
import 'package:tripdash/widget/ViewPackages/PackageCategory.dart';
import 'package:tripdash/widget/ViewPackages/PackageGestureDetector.dart';

import '../user_app_drawer.dart';

class ViewProducts extends StatefulWidget {
  static const routeName = '/ViewProducts';
  const ViewProducts({Key? key}) : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const UserAppDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), // Change the height as desired
        child: AppBarWidget(avatar: 'Assets/avatars/av_1.png'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 8),
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
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: 8, bottom: 8),
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
            const Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PackagaeGestureDetector(name: 'Pokhara', location: 'Pokhara', numberofpep: 'group', price: '1050', stars: '4.6', imgpath: 'Assets/images/ProductImages/Pokhara.jpg'),
                    PackagaeGestureDetector(name: 'Annapurna BC', location: 'Narchyang Myagdi', numberofpep: 'person', price: '500', stars: '4.1', imgpath: 'Assets/images/ProductImages/AnnapurnaBc.jpg'),
                    PackagaeGestureDetector(name: 'Lumbini', location: 'Rupandehi', numberofpep: 'person', price: '200', stars: '4.2', imgpath: 'Assets/images/ProductImages/Lumbini.jpg'),
                  ],
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
            PackageContainer(numberofpep: "Per Person", price: "300", location: "Mustang", stars: "4.4", imgpath: "Assets/images/ProductImages/Mustang.jpg", name: "Mustang"),
            PackageContainer(numberofpep: "Per Person", price: "250", location: "Chitwan", stars: "4.5", imgpath: "Assets/images/ProductImages/Chitwan.jpg", name: "Chitwan"),
            PackageContainer(numberofpep: "Per Person", price: "150", location: "Rara", stars: "4.0", imgpath: "Assets/images/ProductImages/Rara.jpg", name: "Rara"),
          ],
        ),
      ),
    );
  }
}
