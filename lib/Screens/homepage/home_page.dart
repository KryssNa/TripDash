import 'package:flutter/material.dart';

import '../../widget/TripPlanWidgets/trip_images.dart';

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
      drawer:const Drawer(),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 20,
              child: Icon(Icons.notifications,color: Colors.black,),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFCACCCE),
      ),
      body:Column(
        children: [
          SizedBox(
            height: 20,
            ),
            Padding(
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
            Padding(
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
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search Destination",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor:Colors.black,
                )
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child:Column(
                  children: [
                    Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                      foregroundImage: AssetImage('Assets/Images/Dubai.png'),
                                      radius: 30,
                                ),
                                Text("Dubai")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                      backgroundImage: AssetImage('Assets/Images/Bali.png'),
                                      radius: 30,
                                ),
                                Text("Bali")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('Assets/Images/Antartica.png'),
                                  radius: 30,
                                ),
                                Text("Antartica")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                      backgroundImage:AssetImage('Assets/Images/london.png'),
                                      radius: 30,
                                ),
                                Text("London")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage:AssetImage('Assets/Images/Maldives.png'),
                                  radius: 30,
                                ),
                                Text("Maldives")
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal ,
                            child: Row(
                              children: [Container(child: Image.asset('Assets/Images/ro.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/rome.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/london.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/Paris.png'), 
                                ),
                                Container(
                                  child: Image.asset("Assets/Images/london.png"),
                                )],
                            ),
                          ),
                        ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Popular Destination",
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal ,
                            child: Row(
                              children: [
                                Container(child: Image.asset('Assets/Images/popular4.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/popular1.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/popular2.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/popular3.png'), 
                                ),
                                Container(
                                  child: Image.asset("Assets/Images/london.png"),
                                )
                                ],
                            ),
                          ),
                        ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Find the place in the map",
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal ,
                            child:
                            Container(
                                child: Image.asset('Assets/Images/map2.png'), 
                              ),
                          ),
                        ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal ,
                            child: Row(
                              children: [
                                Container(child: Image.asset('Assets/Images/Recommended1.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/Recommended1.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/Recommended2.png'), 
                                ),
                                Container(child: Image.asset('Assets/Images/Recommended3.png'), 
                                ),
                                Container(
                                  child: Image.asset("Assets/Images/london.png"),
                                )],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
              )
            
      ],
      )
    );
  }
}