import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/AdminAppDrawer.dart';


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
      drawer: AdminAppDrawer(),
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
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal ,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('Dubai button tapped!');
                            },
                            child: Padding(
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
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Bali button tapped!');
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: AssetImage('Assets/Images/Bali.png'),
                                    radius: 30,
                                  ),
                                  Text("Bali")
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Antartica button tapped!');
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: AssetImage('Assets/Images/Antartica.png'),
                                    radius: 30,
                                  ),
                                  Text("Antartica")
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('London button tapped!');
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: AssetImage('Assets/Images/london.png'),
                                    radius: 30,
                                  ),
                                  Text("London")
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Maldives button tapped!');
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: AssetImage('Assets/Images/Maldives.png'),
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
              ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal ,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Rome");
                            },
                            child:Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset('Assets/Images/ro.png'),
                                Positioned.fill(
                                  child: FractionallySizedBox(
                                    alignment: Alignment.bottomLeft,
                                    heightFactor: 0.3,
                                    child: Container(
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
                                ),
                              ],
                            ),
                          ),
                      ),
                          GestureDetector(
                            onTap: () {
                              print("Rome");
                            },
                          child:Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset('Assets/Images/ro.png'),
                                Positioned.fill(
                                  child: FractionallySizedBox(
                                    alignment: Alignment.bottomLeft,
                                    heightFactor: 0.3,
                                    child: Container(
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
                                ),
                              ],
                            ),
                          ),
                      ),
                          GestureDetector(
                            onTap: () {
                              print("London");
                            },
                          child:Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset('Assets/Images/location.png'),
                                Positioned.fill(
                                  child: FractionallySizedBox(
                                    alignment: Alignment.bottomLeft,
                                    heightFactor: 0.3,
                                    child: Container(
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
                                ),
                              ],
                            ),
                          ),
                      ),
                          GestureDetector(
                            onTap: () {
                              print("Paris");
                            },
                          child:Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset('Assets/Images/Paris.png'),
                                Positioned.fill(
                                  child: FractionallySizedBox(
                                    alignment: Alignment.bottomLeft,
                                    heightFactor: 0.3,
                                    child: Container(
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
                                ),
                              ],
                            ),
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
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal ,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print("Popular1");
                                  },
                                child: Container(child: Image.asset('Assets/Images/popular4.png'), 
                                ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("Popular2");
                                  },
                                child: Container(child: Image.asset('Assets/Images/popular1.png'), 
                                ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("Popular3");
                                  },
                                child: Container(child: Image.asset('Assets/Images/popular2.png'), 
                                ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("Popular4");
                                  },
                                  child: Container(child: Image.asset('Assets/Images/popular3.png'), 
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Padding(
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
                                  print("MAp");
                                },
                                child: Container(
                                  child: Image.asset('Assets/Images/map2.png'), 
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Padding(
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
                                  print("Recommended 1");
                                },
                              child:Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                  alignment: Alignment.center,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      height: 100,
                                      width: 350,
                                      color: Color.fromARGB(255, 245, 212, 80),
                                        child:Column(
                                          children: [
                                            Row(
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Image.asset('Assets/Images/Recommended1.png'),
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
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
                                                          padding: const EdgeInsets.all(8.0),
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
                                                            const SizedBox(
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
                          ),
                          GestureDetector(
                                onTap: () {
                                  print("Recommended 2");
                                },
                              child:Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                  alignment: Alignment.center,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      height: 100,
                                      width: 350,
                                      color: Color.fromARGB(255, 245, 212, 80),
                                        child:Column(
                                          children: [
                                            Row(
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Image.asset('Assets/Images/Recommended2.png'),
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
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
                                                          padding: const EdgeInsets.all(8.0),
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
                                                            const SizedBox(
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
                          ),
                          GestureDetector(
                                onTap: () {
                                  print("Recommended 3");
                                },
                              child:Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                  alignment: Alignment.center,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      height: 100,
                                      width: 350,
                                      color: Color.fromARGB(255, 245, 212, 80),
                                        child:Column(
                                          children: [
                                            Row(
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Image.asset('Assets/Images/Recommended3.png'),
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
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
                                                          padding: const EdgeInsets.all(8.0),
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
                                                            const SizedBox(
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
                          ),
                          ],
                          ),
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