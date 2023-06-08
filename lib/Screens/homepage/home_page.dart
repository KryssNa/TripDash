import 'package:flutter/material.dart';


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
                  Container(
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal ,
                      child: Row(
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
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal ,
                      child: Row(
                        children: [
                          Container(
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
                          Container(
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
                          Container(
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
                          Container(
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
                        ],   
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
                              Container(
                                child: Image.asset('Assets/Images/map2.png'), 
                              ),
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
                              Container(
                                child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                    child: Container(
                                      height: 80,
                                      width: 350,
                                      color: Color.fromARGB(255, 245, 212, 80),
                                      child:Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Image.asset('Assets/Images/Recommended3.png'),
                                              ),
                                              SizedBox(width: 10,),
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                      children: [
                                                        const Text("Maldives"),
                                                        const Text("East Coast"),
                                                        const SizedBox(
                                                          width: 10,
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text('56/per person'),
                                                            const SizedBox(
                                                              width: 40,
                                                            ),
                                                            Text('4.5')
                                                          ],
                                                        )
                                                      ],
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
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      height: 80,
                                      width: 350,
                                      color: Color.fromARGB(255, 245, 212, 80),
                                        child:Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child: Image.asset('Assets/Images/Recommended1.png'),
                                                ),
                                                SizedBox(width: 10,),
                                                Container(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      children: [
                                                        const Text("Paris"),
                                                        const Text("Eifil Tower"),
                                                        const SizedBox(
                                                          width: 10,
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text('5/per person'),
                                                            const SizedBox(
                                                              width: 40,
                                                            ),
                                                            Text('4.5')
                                                          ],
                                                        )
                                                      ],
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
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                  alignment: Alignment.center,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      height: 80,
                                      width: 350,
                                      color: Color.fromARGB(255, 245, 212, 80),
                                        child:Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child: Image.asset('Assets/Images/Recommended2.png'),
                                                ),
                                                SizedBox(width: 10,),
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      children: [
                                                        const Text("Nepal"),
                                                        const Text("Tara Bhir"),
                                                        const SizedBox(
                                                          width: 10,
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text('56/per person'),
                                                            const SizedBox(
                                                              width: 40,
                                                            ),
                                                            Text('4.5')
                                                          ],
                                                        )
                                                      ],
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