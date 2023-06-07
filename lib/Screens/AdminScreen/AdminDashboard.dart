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
        title: Text("This is app bar"),
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

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
