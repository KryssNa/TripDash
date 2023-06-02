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
      body:const Column(
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
                                      foregroundImage: AssetImage('Assets/images/Dubai.png'),
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
                                      backgroundImage: AssetImage('Assets/images/Bali.png'),
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
                                  backgroundImage: AssetImage('Assets/images/Antartica.png'),
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
                                      backgroundImage:AssetImage('Assets/images/london.png'),
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
                                  backgroundImage:AssetImage('Assets/images/Maldives.png'),
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
                              children: [
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 18, top: 8, bottom: 10, right: 13), values: 185),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 18, top: 8, bottom: 10, right: 13), values: 185),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150)
                              ],
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
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 18, top: 8, bottom: 10, right: 13), values: 185),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 18, top: 8, bottom: 10, right: 13), values: 185),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150)
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
                            child: Row(
                              children: [
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 18, top: 8, bottom: 10, right: 13), values: 185),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 18, top: 8, bottom: 10, right: 13), values: 185),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150)
                              ],
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
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 18, top: 8, bottom: 10, right: 13), values: 185),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 18, top: 8, bottom: 10, right: 13), values: 185),
                                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150)
                              ],
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