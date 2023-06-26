import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/admin_app_drawer.dart';

import '../UserScreen/app_bar.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  static const routeName = '/Homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminAppDrawer(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), // Change the height as desired
          child: AppBarWidget(avatar: 'Assets/avatars/av_1.png'),
        ),
      body:Column(
        children: [
          const SizedBox(
            height: 20,
            ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Hello Muthu ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Where do you want to go?",
                style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                hintText: "Search Destination",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child:Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal ,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('Dubai button tapped!');
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  foregroundImage: AssetImage('Assets/images/Dubai.png'),
                                  radius: 30,
                                ),
                                Text("Dubai")
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('Bali button tapped!');
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  foregroundImage: AssetImage('Assets/images/Bali.png'),
                                  radius: 30,
                                ),
                                Text("Bali")
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('Antartica button tapped!');
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  foregroundImage: AssetImage('Assets/images/Antartica.png'),
                                  radius: 30,
                                ),
                                Text("Antartica")
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('London button tapped!');
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  foregroundImage: AssetImage('Assets/images/london.png'),
                                  radius: 30,
                                ),
                                Text("London")
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('Maldives button tapped!');
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  foregroundImage: AssetImage('Assets/images/Maldives.png'),
                                  radius: 30,
                                ),
                                Text("Maldives")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal ,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (kDebugMode) {
                                print("Rome");
                              }
                            },
                            child:Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset('Assets/images/ro.png'),
                                const Positioned.fill(
                                  child: FractionallySizedBox(
                                    alignment: Alignment.bottomLeft,
                                    heightFactor: 0.3,
                                    child: Center(
                                      child: Text(
                                        "Rome",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 219, 17, 30),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ),
                          GestureDetector(
                            onTap: () {
                              if (kDebugMode) {
                                print("Rome");
                              }
                            },
                          child:Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image.asset('Assets/images/ro.png'),
                              const Positioned.fill(
                                child: FractionallySizedBox(
                                  alignment: Alignment.bottomLeft,
                                  heightFactor: 0.3,
                                  child: Center(
                                    child: Text(
                                      "Rome",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 219, 17, 30),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                          GestureDetector(
                            onTap: () {
                              if (kDebugMode) {
                                print("London");
                              }
                            },
                          child:Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image.asset('Assets/images/location.png'),
                              const Positioned.fill(
                                child: FractionallySizedBox(
                                  alignment: Alignment.bottomLeft,
                                  heightFactor: 0.3,
                                  child: Center(
                                    child: Text(
                                      "London",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 219, 17, 30),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                          GestureDetector(
                            onTap: () {
                              if (kDebugMode) {
                                print("Paris");
                              }
                            },
                          child:Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image.asset('Assets/images/Paris.png'),
                              const Positioned.fill(
                                child: FractionallySizedBox(
                                  alignment: Alignment.bottomLeft,
                                  heightFactor: 0.3,
                                  child: Center(
                                    child: Text(
                                      "Paris",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 219, 17, 30),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),],   
                      ),
                    ),
                  ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
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
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal ,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (kDebugMode) {
                                      print("Popular1");
                                    }
                                  },
                                child: Image.asset('Assets/images/popular4.png'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (kDebugMode) {
                                      print("Popular2");
                                    }
                                  },
                                child: Image.asset('Assets/images/popular1.png'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (kDebugMode) {
                                      print("Popular3");
                                    }
                                  },
                                child: Image.asset('Assets/images/popular2.png'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (kDebugMode) {
                                      print("Popular4");
                                    }
                                  },
                                  child: Image.asset('Assets/images/popular3.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child:  Text(
                                  "Find the place in the map",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ),
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
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child:  Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Recommended",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kDebugMode) {
                                  print("Recommended 1");
                                }
                              },
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                              alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  height: 100,
                                  width: 350,
                                  color: const Color.fromARGB(255, 245, 212, 80),
                                    child:Column(
                                      children: [
                                        Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset('Assets/images/Recommended1.png'),
                                          ),
                                          const SizedBox(width: 10,),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Paris",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.bottomLeft,
                                                        child: Icon(
                                                          Icons.location_on,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Eiffel Tower",
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '50/per person',
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                    ),
                                                    Text(
                                                      '4.5',
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
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
                            ),
                        ),
                        GestureDetector(
                              onTap: () {
                                if (kDebugMode) {
                                  print("Recommended 2");
                                }
                              },
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                              alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  height: 100,
                                  width: 350,
                                  color: const Color.fromARGB(255, 245, 212, 80),
                                    child:Column(
                                      children: [
                                        Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset('Assets/images/Recommended2.png'),
                                          ),
                                          const SizedBox(width: 10,),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Nepal",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.bottomLeft,
                                                        child: Icon(
                                                          Icons.location_on,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Tara Bhir",
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '50/per person',
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                    ),
                                                    Text(
                                                      '4.5',
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
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
                            ),
                        ),
                        GestureDetector(
                              onTap: () {
                                if (kDebugMode) {
                                  print("Recommended 3");
                                }
                              },
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                              alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  height: 100,
                                  width: 350,
                                  color: const Color.fromARGB(255, 245, 212, 80),
                                    child:Column(
                                      children: [
                                        Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset('Assets/images/Recommended3.png'),
                                          ),
                                          const SizedBox(width: 10,),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Maldives",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.bottomLeft,
                                                        child: Icon(
                                                          Icons.location_on,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "East coast",
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '50/per person',
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                    ),
                                                    Text(
                                                      '4.5',
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
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
                            ),
                        ),
                        ],
                        ),  
                      ] ,
                    ),
                  ),
            ),
        ],
      )
    );
  }
}