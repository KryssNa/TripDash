import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});
  static const routeName = '/UserDashboard';

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: Color(0xff5d9de7),
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,

            actions: [
              Padding(
                padding:  EdgeInsets.only(top:5.0,right: 10),
                child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {

                    },
                    child:CircleAvatar(
                      radius: 25,
                      backgroundImage:
                      AssetImage("Assets/images/avatars/av_1.png"),
                    )
                ),
              ),
            ],
            leading: Builder(
              builder: (context) => IconButton(
                icon:  Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )
        ),

        body: SafeArea(
        child: SingleChildScrollView(
          child:Container(
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Padding(
                  padding:
                  const EdgeInsets.only(left: 35.0, right: 35,),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hello, User",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: 30,
                            width: 30,
                            child: IconButton(
                              onPressed: () {
                                // Add your logic here
                              },
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35.0, top: 10),
                  child: Text(
                    "Where do you want to go?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
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
                ),
                Container(
                  margin: const EdgeInsets.only( left: 20, right: 20),
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
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(

                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal ,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('Dubai button tapped!');
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          foregroundImage: AssetImage('Assets/images/Hotel.png'),
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          foregroundImage: AssetImage('Assets/images/Hotel.png'),
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          foregroundImage: AssetImage('Assets/images/Hotel.png'),
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          foregroundImage: AssetImage('Assets/images/Hotel.png'),
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          foregroundImage: AssetImage('Assets/images/Hotel.png'),
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

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20,top: 8,bottom: 8),
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
                                padding: EdgeInsets.only(left: 20, right: 20,top: 8,bottom: 8),
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

                         

                        ],
                      ),
                    ),
                  ),
                ),



              ]
            ),
          )
        )
      )
    );
  }
}
