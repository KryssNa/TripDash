import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripdash/Repositeries/place_repositories.dart';
import 'package:tripdash/Screens/ViewPlace/place_list_model.dart';
import 'package:tripdash/model/place_model.dart';
import 'place_listview.dart';
import 'place_theme.dart';

class PlaceHomeScreen extends StatefulWidget {
  static String routeName = '/PlaceHomeScreen';

  const PlaceHomeScreen({super.key});

  @override
  State<PlaceHomeScreen> createState() => _PlaceHomeScreenState();
}

class _PlaceHomeScreenState extends State<PlaceHomeScreen>
    with TickerProviderStateMixin {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  List<PlaceListData> placeList = PlaceListData.placeList;
  AnimationController? animationController;
  List<QueryDocumentSnapshot<PlaceModel>> placeFirevase = [];
  Future<void> getData() async {
    final response  = await PlaceRepository().getDataNormal();
    setState(() {
      placeFirevase = response;
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
              color: PlaceTheme.buildLightTheme().colorScheme.background,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final int count =
                      placeFirevase.length > 10 ? 10 : placeFirevase.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController!.forward();
                  return PlaceListView(
                    callback: () {},
                    placeData: placeFirevase[index].data(),
                    animation: animation,
                    animationController: animationController,
                  );
                },
                itemCount: placeFirevase.length,
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
                  color: PlaceTheme.buildLightTheme().colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 2),
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0)
                  ]),
            )),
        Container(
          color: PlaceTheme.buildLightTheme().colorScheme.background,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '5 place Found',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                )),
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Filter',
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.sort,
                            color: PlaceTheme.buildLightTheme().primaryColor,
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
                  color: PlaceTheme.buildLightTheme().colorScheme.background,
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
                    fontWeight: FontWeight.w600,
                  ),
                  cursorColor: PlaceTheme.buildLightTheme().primaryColor,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Search Place"),
                ),
              ),
            ),
          )),
          Container(
            decoration: BoxDecoration(
                color: PlaceTheme.buildLightTheme().primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(38.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(0, 2),
                      blurRadius: 8.0)
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.search,
                      size: 26,
                      color: PlaceTheme.buildLightTheme().colorScheme.background,
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
                            fontWeight: FontWeight.w600,
                            color: Colors.black12.withOpacity(1)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${DateFormat('dd, MMM').format(startDate)} - ${DateFormat('dd, MMM').format(endDate)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
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
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '',
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
          color: PlaceTheme.buildLightTheme().colorScheme.background,
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
                "View Place",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
            )),
            SizedBox(
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
