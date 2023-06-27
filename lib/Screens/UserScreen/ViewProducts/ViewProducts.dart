import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/app_bar.dart';

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
            Row(
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: SizedBox(
                        width: 205,
                        height: 250,
                        child: Stack(
                          // alignment: Alignment.center,
                          fit: StackFit.expand,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              // bottom: 250,
                              child: Container(
                                height: 150,
                                width: 200,
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'Assets/images/ProductImages/AnnapurnaBc.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // top: 120,
                              left: 11,
                              bottom: 20,
                              child: Container(
                                height: 105,
                                width: 180,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Annapurna BC   ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          WidgetSpan(
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "4.1",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.place,
                                              color: Colors.green,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Narchyang Myagdi",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xff03bdc9),
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "500",
                                            style: TextStyle(
                                              color: Color(0xff03bdc9),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          TextSpan(
                                            text: " /person",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          WidgetSpan(
                                              child: Icon(Icons.favorite,
                                                color: Color(0xff056e73),
                                                size: 20,)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ), //Container

                            //container for text, location and price and rating to be placed on bottom of the image
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: SizedBox(
                        width: 205,
                        height: 250,
                        child: Stack(
                          // alignment: Alignment.center,
                          fit: StackFit.expand,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              // bottom: 250,
                              child: Container(
                                height: 150,
                                width: 200,
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'Assets/images/ProductImages/Lumbini.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // top: 120,
                              left: 11,
                              bottom: 20,
                              child: Container(
                                height: 105,
                                width: 180,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Lumbini     ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          WidgetSpan(
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "4.2",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.place,
                                              color: Colors.green,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "  Rupandehi",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xff03bdc9),
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "200",
                                            style: TextStyle(
                                              color: Color(0xff03bdc9),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          TextSpan(
                                            text: " /person",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          WidgetSpan(
                                              child: Icon(Icons.favorite,
                                                color: Color(0xff056e73),
                                                size: 20,)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ), //Container

                            //container for text, location and price and rating to be placed on bottom of the image
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: SizedBox(
                        width: 205,
                        height: 250,
                        child: Stack(
                          // alignment: Alignment.center,
                          fit: StackFit.expand,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              // bottom: 250,
                              child: Container(
                                height: 150,
                                width: 200,
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'Assets/images/ProductImages/Pokhara.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // top: 120,
                              left: 11,
                              bottom: 20,
                              child: Container(
                                height: 105,
                                width: 180,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Pokhara     ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          WidgetSpan(
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "4.6",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.place,
                                              color: Colors.green,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "  Pokhara,",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xff03bdc9),
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "350",
                                            style: TextStyle(
                                              color: Color(0xff03bdc9),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          TextSpan(
                                            text: " /person",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          WidgetSpan(
                                              child: Icon(Icons.favorite,
                                                color: Color(0xff056e73),
                                                size: 20,)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ), //Container
                            // container for text, location and price and rating to be placed on bottom of the image
                          ],
                        ),
                      ),
                    ),
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
                      "Popular Destination",
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
            Container(
              height: 150,
              width: 525,
              margin:
              const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 90,
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                          image: AssetImage(
                            'Assets/images/userDashboard/sPlace4.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, top: 25, bottom: 30, right: 5),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 5,
                                ),
                                child: Text(
                                  "Enjoy Summer Vaccation",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text("4.5")
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0, top: 10, right: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(" San Francisco")
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.attach_money,
                                            color: Color(0xff03bdc9),
                                            size: 18,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "200",
                                          style: TextStyle(
                                            color: Color(0xff03bdc9),
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " /Per Person",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 525,
              margin:
              const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 90,
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                          image: AssetImage(
                            'Assets/images/userDashboard/sPlace4.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, top: 25, bottom: 30, right: 5),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 5,
                                ),
                                child: Text(
                                  "Enjoy Summer Vaccation",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text("4.5")
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0, top: 10, right: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(" San Francisco")
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.attach_money,
                                            color: Color(0xff03bdc9),
                                            size: 18,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "200",
                                          style: TextStyle(
                                            color: Color(0xff03bdc9),
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " /Per Person",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 525,
              margin:
              const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 90,
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                          image: AssetImage(
                            'Assets/images/userDashboard/sPlace4.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, top: 25, bottom: 30, right: 5),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 5,
                                ),
                                child: Text(
                                  "Enjoy Summer Vaccation",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text("4.5")
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0, top: 10, right: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(" San Francisco")
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.attach_money,
                                            color: Color(0xff03bdc9),
                                            size: 18,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "200",
                                          style: TextStyle(
                                            color: Color(0xff03bdc9),
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " /Per Person",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
