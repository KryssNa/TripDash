import 'package:flutter/material.dart';

import '../../constant/Colors.dart';
import '../../widget/textStyle.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  static const routeName = '/AdminDashboard';

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset("Assets/icons/sideIcon.png"),
        
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Container(
            color: ConstColors.whiteColor,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Dashboard",
                  style: buildTextStyle(ConstColors.adminPrimaryHeadingText),),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      width: 170,
                      decoration: BoxDecoration(
                        color: ConstColors.adminPanelBoxColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("Assets/icons/icon-booking.png"),
                          Text(
                            "Bookings",
                            style: buildTextStyle(
                                ConstColors.adminSecondaryHeadingText),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 170,
                      decoration: BoxDecoration(
                        color: ConstColors.adminPanelBoxColor4,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "Assets/icons/totalClient.png",
                            height: 55,
                          ),
                          Text(
                            "Total Clients",
                            style: buildTextStyle(
                                ConstColors.adminSecondaryHeadingText),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 170,
                      decoration: BoxDecoration(
                        color: ConstColors.adminPanelBoxColor2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("Assets/icons/icon-hotel.png"),
                          Text(
                            "Hotels",
                            style: buildTextStyle(
                                ConstColors.adminSecondaryHeadingText),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 175,
                      decoration: BoxDecoration(
                        color: ConstColors.adminPanelBoxColor3,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("Assets/icons/icon-revenue.png"),
                          Text(
                            "Revenue",
                            style: buildTextStyle(
                                ConstColors.adminSecondaryHeadingText),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ConstColors.adminPanelPrimaryTextColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(children: [
                      Container(
                        color: ConstColors.adminPanelPrimaryHeadingColor,
                        height: 30,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Text(
                                  "Revenue Graph",
                                  style: buildTextStyle(
                                      ConstColors.adminPrimaryHeadingText),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Container(
                                height: 20,
                                color: ConstColors
                                    .adminPanelSecondaryHeadingColor,
                                child: const Row(
                                  children: [
                                    Text("Monthly"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Weekly",
                                      style: TextStyle(
                                        fontFamily: 'SSFPro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Yearly"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // height: 200,
                        // width: 200,
                          child: Image.asset("Assets/images/Graph.png")),
                    ]),
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Text("Featured Hotels",
                    style: buildTextStyle(ConstColors.adminPrimaryHeadingText),),
                ),

                const SizedBox(height: 20,),

                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("Assets/images/Hotel.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("Assets/images/Hotel.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("Assets/images/Hotel.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("Assets/images/Hotel.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("Assets/images/Hotel.png"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ConstColors.adminPanelPrimaryTextColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(children: [
                      Container(
                        color: ConstColors.adminPanelPrimaryHeadingColor,
                        height: 30,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Text(
                                  "Statistics Graph",
                                  style: buildTextStyle(
                                      ConstColors.adminPrimaryHeadingText),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Container(
                                height: 20,
                                color: ConstColors
                                    .adminPanelSecondaryHeadingColor,
                                child: const Row(
                                  children: [
                                    Text("Monthly"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Weekly",
                                      style: TextStyle(
                                        fontFamily: 'SSFPro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Yearly"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // height: 200,
                        // width: 200,
                          child: Image.asset("Assets/images/Graph.png")),
                    ]),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Individual Hotels Update",
                        style: buildTextStyle(ConstColors.adminPrimaryHeadingText),),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: TextButton(
                            onPressed: () {}, child: const Text("More >>",
                            style: TextStyle(color: ConstColors.adminPanelButtonColor,))),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ConstColors.adminPanelPrimaryTextColor),
                      borderRadius: BorderRadius.circular(8),
                      color: ConstColors.adminPanelSecondaryHeadingColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("Assets/images/hotelannapurna.png",
                        ),
                        Text("Hotel AnnaPurna",
                          style: buildTextStyle( ConstColors.adminPanelPrimaryTextColor,),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 65.0,left: 20),
                          child: TextButton(
                              onPressed: () {}, child: const Text("More info >>",
                              style: TextStyle(color: ConstColors.adminPanelButtonColor,))),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ConstColors.adminPanelPrimaryTextColor),
                      borderRadius: BorderRadius.circular(8),
                      color: ConstColors.adminPanelSecondaryHeadingColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("Assets/images/hotelannapurna.png",
                        ),
                        Text("Hotel AnnaPurna",
                          style: buildTextStyle( ConstColors.adminPanelPrimaryTextColor,),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 65.0,left: 20),
                          child: TextButton(
                              onPressed: () {}, child: const Text("More info >>",
                              style: TextStyle(color: ConstColors.adminPanelButtonColor,))),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ConstColors.adminPanelPrimaryTextColor),
                      borderRadius: BorderRadius.circular(8),
                      color: ConstColors.adminPanelSecondaryHeadingColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("Assets/images/hotelannapurna.png",
                        ),
                        Text("Hotel AnnaPurna",
                          style: buildTextStyle( ConstColors.adminPanelPrimaryTextColor,),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 65.0,left: 20),
                          child: TextButton(
                              onPressed: () {}, child: const Text("More info >>",
                              style: TextStyle(color: ConstColors.adminPanelButtonColor,))),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Text("Services",
                    style: buildTextStyle(ConstColors.adminPrimaryHeadingText),),
                ),

                const SizedBox(height: 10,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 20),
                  child: Row(children: [
                    // image button

                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Image.asset("Assets/images/R4.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Image.asset("Assets/images/R2.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Image.asset("Assets/images/R3.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Image.asset("Assets/images/R4.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Image.asset("Assets/images/R3.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Image.asset("Assets/images/R2.png"),
                    ),


                  ]),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
