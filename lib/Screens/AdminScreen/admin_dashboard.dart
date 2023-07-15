import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripdash/Screens/AdminScreen/admin_app_drawer.dart';
import 'package:tripdash/Screens/HotelViewScreen/hotel_home_screen.dart';
import 'package:tripdash/Screens/UserScreen/Profile/user_profile.dart';
import 'package:tripdash/Screens/UserScreen/ViewProducts/view_products.dart';
import 'package:tripdash/Screens/UserScreen/app_bar.dart';
import 'package:tripdash/Screens/ViewPlaceScreen/place_screen.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/widget/text_style.dart';


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
      drawer: const AdminAppDrawer(),
      appBar:const PreferredSize(
    preferredSize: Size.fromHeight(50), // Change the height as desired
    child: AppBarWidget(avatar: 'Assets/avatars/av_1.png'),
    ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0x51289a8e),
        selectedItemColor: Colors.red,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: ConstColors.whiteColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: ConstColors.whiteColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: ConstColors.whiteColor,
          ),
        ],

        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, AdminDashboard.routeName);
          }
          if (index == 1) {
            Navigator.pushNamed(context, AdminDashboard.routeName);
          }
          if (index == 2) {
            Navigator.pushNamed(context, UserProfile.routeName);
          }
        },
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Container(
            color: ConstColors.whiteColor,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 0),
                  child: Text("Dashboard",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.green,
                  ),
                ),
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    //total booking container
                    Container(
                      height: 90,
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

                    //total client container
                    Container(
                      height: 90,
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

                    //hotel container
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, HotelHomeScreen.routeName);
                      },
                      child: Container(
                        height: 90,
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
                    ),

                    //revenue container
                    Container(
                      height: 90,
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

                //places container
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PlaceHomeScreen.routeName);
                  },
                  child: Container(
                    margin: const EdgeInsets.all( 18),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xfffdddd5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("Assets/icons/placeLogo.jpg",height: 150,
                        width: 220,),
                        Text(
                          "Places",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //products container
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ViewProducts.routeName);
                  },
                  child: Container(
                    margin: const EdgeInsets.only( left: 18, right: 18, bottom: 6),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff71c3cc),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("Assets/icons/productsL.jpg",height: 150,
                        width: 210,),
                        Text(
                          "Products",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
