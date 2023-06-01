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
                      child: Column(children: [
                        TripImages(imageAddress: "https://images.unsplash.com/photo-1592364395653-83e648b20cc2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only( bottom: 10, right: 15, top: 0, left: 5), values: 185),
                      ],)
                    
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
                      child: Column(children: [
                        TripImages(imageAddress: "https://images.unsplash.com/photo-1592364395653-83e648b20cc2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only( bottom: 10, right: 15, top: 0, left: 5), values: 185),
                      ],)
                    
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
                      child: Column(children: [
                        TripImages(imageAddress: "https://images.unsplash.com/photo-1592364395653-83e648b20cc2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only( bottom: 10, right: 15, top: 0, left: 5), values: 185),
                      ],)
                    
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
                      child: Column(children: [
                        TripImages(imageAddress: "https://images.unsplash.com/photo-1592364395653-83e648b20cc2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only( bottom: 10, right: 15, top: 0, left: 5), values: 185),
                      ],)
                    
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