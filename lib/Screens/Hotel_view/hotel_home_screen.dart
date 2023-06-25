import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_ui/hotel_ui/hotel_list_model.dart';
// import 'package:flutter_ui/hotel_ui/hotel_list_view.dart';
// import 'package:flutter_ui/hotel_ui/hotel_theme.dart';
import 'package:intl/intl.dart';
import 'package:tripdash/Repositeries/hotel_repositories.dart';

import '../../model/Hotel_Model.dart';
import 'hotel_list_model.dart';
import 'hotel_list_view.dart';
import 'hotel_theme.dart';

class HotelHomeScreen extends StatefulWidget {
  static String  routeName='/HotelHomeScreen';

  const HotelHomeScreen({super.key});

  @override
  State<HotelHomeScreen> createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with TickerProviderStateMixin {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  List<HotelListData> hotelList = HotelListData.hotelList;
  AnimationController? animationController;
  List<QueryDocumentSnapshot<HotelModel>> hotelFirevase = [];
  Future<void> getData() async {
    final response  = await HotelRepository().getDataNormal();
    setState(() {
      hotelFirevase = response;
    });
  }
  @override
  void initState() {
    super.initState();
    getData();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getAppBarUI(),
          Expanded(
              child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Column(
                    children: <Widget>[getSearchBarUI(), getTimeDateUI()],
                  );
                }, childCount: 1)),
                SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: ContestTabHeader(getFilterBarUI()))
              ];
            },
            body: Container(
              color: HotelTheme.buildLightTheme().backgroundColor,
              child: ListView.builder(
                itemBuilder: (context, index) {
                 final int count=hotelFirevase.length > 10 ? 10 : hotelFirevase.length;
                 final Animation<double> animation =Tween<double>(
                  begin: 0.0,
                  end: 1.0
                 ).animate(CurvedAnimation(parent: animationController!, curve: Interval(
                  (1/count) * index,1.0,curve: Curves.fastOutSlowIn
                 )));
                 animationController!.forward();
                  return HotelListView(
                    callback: () {},
                    hotelData: hotelFirevase[index].data(),
                    animation: animation,
                    animationController: animationController,
                  );
                },
                itemCount: hotelFirevase.length,
                padding: const EdgeInsets.only(top: 8),
                scrollDirection: Axis.vertical,
              ),
            ),
          ))
        ],
      ),
    );
  }

  getFilterBarUI() {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                  color: HotelTheme.buildLightTheme().backgroundColor,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0)
                  ]),
            )),
        Container(
          color: HotelTheme.buildLightTheme().backgroundColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '530 hotel Found',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
                  ),
                )),
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Filter',
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.sort,
                            color: HotelTheme.buildLightTheme().primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8, left: 16, right: 16),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: HotelTheme.buildLightTheme().backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(38.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 4, bottom: 4),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  cursorColor: HotelTheme.buildLightTheme().primaryColor,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Kathmandu..."),
                ),
              ),
            ),
          )),
          Container(
            decoration: BoxDecoration(
                color: HotelTheme.buildLightTheme().primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(38.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(0, 2),
                      blurRadius: 8.0)
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                onTap: () {},
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.search,
                      size: 26,
                      color: HotelTheme.buildLightTheme().backgroundColor,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Choose Date",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${DateFormat('dd, MMM').format(startDate)} - ${DateFormat('dd, MMM').format(endDate)}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Number of Rooms',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '1 Room - 2 Adults',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
          color: HotelTheme.buildLightTheme().backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 8.0)
          ]),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            const Expanded(
                child: Center(
              child: Text(
                "View Hotel",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
            )),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.location_on_rounded),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  final Widget searchUI;
  ContestTabHeader(this.searchUI);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
