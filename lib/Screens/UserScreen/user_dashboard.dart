import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/ViewDetails/view_details2.dart';
import 'package:tripdash/Screens/UserScreen/ViewDetails/view_details3.dart';
import 'package:tripdash/Screens/UserScreen/ViewDetails/view_details4.dart';
import 'package:tripdash/Screens/UserScreen/ViewDetails/view_details5.dart';
import 'package:tripdash/Screens/UserScreen/ViewDetails/view_details6.dart';
import 'package:tripdash/Screens/UserScreen/user_app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:tripdash/Screens/TransportationScreen/view_details.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';
import 'package:tripdash/widget/destination_card.dart';
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
            backgroundColor: Colors.white,
            drawer: const UserAppDrawer(),
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(avatar: 'Assets/avatars/av_1.png'),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                                'Assets/avatars/av_1.png'),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'Hello,\n',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "${auth.loggedInUser?.name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                          popularDestinations(context),
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
                                          'Assets/images/mustang.jpg',
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
                                                Text(" Mustang")
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
                                                        text: "400",
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
                                          'Assets/images/boudha.jpg',
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
                                                Text("4.1")
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
                                                Text(" Boudha")
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
                                                        text: "100",
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
                                          'Assets/images/kathmandu.jpg',
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
                                                    text: "150",
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
                                          'Assets/images/rara.jpg',
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
                                            "Rara, Nepal",
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
                                                Text(" Rara Lake"),
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
                                                    text: "250",
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
                                          'Assets/images/dhulikhel.jpg',
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
                                            "Dhulikhel, Nepal",
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
                                                Text(" Dhulikhel"),
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
                                                    text: "100",
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
                    'Assets/images/annapurna.jpg',
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
                          Text(" Annapurna")
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
                                'Assets/images/pokhara.jpg'),
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
                                    text: "Pokhara         ",
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
                                    text: "  pokhara,",
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
                                'Assets/images/lumbini.jpg'),
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
                                    text: "Lumbini         ",
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
                                    text: "  lumbini,",
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
                                    text: "230",
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
                                'Assets/images/chitwan.jpg'),
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
                                    text: "Chitwan         ",
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
                                    text: "  Chitwan,",
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
                                    text: "270",
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

Widget popularDestinations(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    child:   SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          DestinationCard(
            name: 'Lake Ciliwung',
            city: 'Tangerang',
            imageUrl: 'Assets/images/userDashboard/image_destination1.png',
            rating: 4.8, onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage2(),
              ),
            );
          },

          ),
          DestinationCard(
            name: 'White Houses',
            city: 'Spain',
            imageUrl: 'Assets/images/userDashboard/image_destination2.png',
            rating: 4.7, onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage3(),
              ),
            );
          },
          ),
          DestinationCard(
            name: 'Hill Heyo',
            city: 'Monaco',
            imageUrl: 'Assets/images/userDashboard/image_destination3.png',
            rating: 4.8, onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage4(),
              ),
            );
          },
          ),
          DestinationCard(
            name: 'Menarra',
            city: 'Japan',
            imageUrl: 'Assets/images/userDashboard/image_destination4.png',
            rating: 5.0,
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage5(),
              ),
            );
          },
          ),
          DestinationCard(
            name: 'Payung Teduh',
            city: 'Singapore',
            imageUrl: 'Assets/images/userDashboard/image_destination5.png',
            rating: 4.8, onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage6(),
              ),
            );
          },
          ),
        ],
      ),
    ),
  );
}
