
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/Account/account.dart';
import 'package:tripdash/Screens/UserScreen/user_dashboard.dart';
import 'package:tripdash/Screens/ViewPlaceScreen/place_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key, });
  static const routeName = '/BottomNavigationBarWidget';


  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int index = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color(0xfff1eded),
        buttonBackgroundColor: const Color(0xffe7f3f1),
        items: [ CurvedNavigationBarItem(
          child: Icon(Icons.home_outlined,color: (index == 0)? Colors.green : Colors.black,size: 30,),
          label: 'Home',
        ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search,color: (index == 1)? Colors.green : Colors.black,size: 30),
            label: 'Search',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity,color: (index == 2)? Colors.green : Colors.black,size: 30),
            label: 'Personal',
          )],
        index: index,
        onTap: (selctedIndex){
          setState(() {
            index = selctedIndex;
          });
        },
        height: 60,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 500),
      ),
      body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)
      ),
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const UserDashboard();
        break;
      case 1:
        widget = const PlaceHomeScreen();
        break;
      default:
        widget = const Account();
        break;
    }
    return widget;
  }

}
