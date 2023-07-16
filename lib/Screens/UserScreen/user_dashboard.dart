import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/user_app_drawer.dart';

import 'package:provider/provider.dart';
import 'package:tripdash/Screens/TransportationScreen/view_details.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';
import '../UserScreen/app_bar.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);
  static const routeName = '/UserDashboard';

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, auth , child) {
        return Scaffold(
            backgroundColor: Colors.blueAccent,
            drawer: const UserAppDrawer(),
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50), // Change the height as desired
              child: AppBarWidget(avatar: 'Assets/avatars/av_1.png'),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hello,  ${auth.loggedInUser!.name}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Where do you want to go?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const NavigationButton(),
                searchArea(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      child: Column(
                        children: [
                          //
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 8, bottom: 8),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Recomended",
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

                          // const SizedBox
                          const RecomendedPlace(),

                          //Popular Destination
                          const PopularDestination(),

                          //Popular Destination Images
                          const PopularDestinationDetails(),

                          //events
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

                          //Events
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Events",
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
                                EdgeInsets.only(left: 20, right: 20, top: 20),
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
                            width: 500,
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
                                    height: 140,
                                    width: 140,
                                    margin: const EdgeInsets.only(
                                      left: 5,
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(right: 5, left: 8),
                                          child: Text(
                                            "Kathmandu, Nepal",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.0, top: 0, right: 5),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                Text(" Sundarijal"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5, left: 8),
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
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: " /night",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //view details button on bottom right
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 100),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.blue,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View Details",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 500,
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
                                    height: 140,
                                    width: 140,
                                    margin: const EdgeInsets.only(
                                      left: 5,
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(right: 5, left: 8),
                                          child: Text(
                                            "Kathmandu, Nepal",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.0, top: 0, right: 5),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                Text(" Sundarijal"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5, left: 8),
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
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: " /night",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //view details button on bottom right
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 100),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.blue,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View Details",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 500,
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
                                    height: 140,
                                    width: 140,
                                    margin: const EdgeInsets.only(
                                      left: 5,
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(right: 5, left: 8),
                                          child: Text(
                                            "Kathmandu, Nepal",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.0, top: 0, right: 5),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                Text(" Sundarijal"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5, left: 8),
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
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: " /night",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //view details button on bottom right
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 100),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.blue,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View Details",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                          //Find the place in the map
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 18.0,left: 20,bottom: 10),
                                child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "Find the place in the map",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    print("MAp");
                                  }
                                },
                                child: Image.asset('Assets/images/map2.png'),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      }
    );
  }

  Container searchArea() {
    return Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 45,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hoverColor: Colors.grey,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
            ),
          );
  }
}

class PopularDestinationDetails extends StatelessWidget {
  const PopularDestinationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class PopularDestination extends StatelessWidget {
  const PopularDestination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}

class RecomendedPlace extends StatelessWidget {
  const RecomendedPlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, DetailPage.routName);
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
                if (kDebugMode) {
                  print("Rommmme");
                }
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
                if (kDebugMode) {
                  print("Rome");
                }
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
    );
  }
}


class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "Assets/icons/aeroplane.png",
                    height: 30,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Flights",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffed6e27)),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.home_work_sharp,
                    color: Colors.white,
                    size: 35,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hotels",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff3ac42),
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.task,
                    color: Colors.white,
                    size: 35,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Tasks",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff03bdc9),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "Assets/icons/car.png",
                    height: 40,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Cars",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
