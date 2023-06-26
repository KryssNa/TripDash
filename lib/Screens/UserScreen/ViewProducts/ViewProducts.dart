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
      body: Column(
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
                                      'Assets/images/userDashboard/place3.png'),
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
                                          text: "Golden Gate     ",
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
                                          text: "4.5",
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
                                          text: "  San Francisco,",
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
                                          text: " /Visit",
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
                                      'Assets/images/userDashboard/place3.png'),
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
                                          text: "Golden Gate     ",
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
                                          text: "4.5",
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
                                          text: "  San Francisco,",
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
                                          text: " /Visit",
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
                                      'Assets/images/userDashboard/place3.png'),
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
                                          text: "Golden Gate     ",
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
                                          text: "4.5",
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
                                          text: "  San Francisco,",
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
                                          text: " /Visit",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
