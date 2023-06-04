import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import '../../../widget/TripPlanWidgets/trip_activities.dart';
import '../../../widget/TripPlanWidgets/trip_buttons.dart';
import '../../../widget/TripPlanWidgets/trip_images.dart';

class TripPlanDetails extends StatefulWidget {
  const TripPlanDetails({Key? key}) : super(key: key);
  static const routeName = '/TripPlanDetails';

  @override
  State<TripPlanDetails> createState() => _TripPlanState();
}

class _TripPlanState extends State<TripPlanDetails> {
  Color divider = Color(int.parse("777F88", radix: 16)).withOpacity(1.0);
  Color buttons = Color(int.parse("FF6700", radix: 16)).withOpacity(1.0);
  String day1 = '';
  String day2 = '';
  String day3 = '';
  String day4 = '';
  String day5 = '';
  String day6 = '';
  String day7 = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
    await firestore.collection('TripDetails').doc('Bali').get();

    if (document.exists) {
      var data = document.data() as Map<String, dynamic>;
      setState(() {
        day1 = data['Day1'] ?? '';
        day2 = data['Day2'] ?? '';
        day3 = data['Day3'] ?? '';
        day4 = data['Day4'] ?? '';
        day5 = data['Day5'] ?? '';
        day6 = data['Day6'] ?? '';
        day7 = data['Day7'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // Add your logic here
          },
          icon: const Icon(Icons.arrow_back,
            color: Colors.black,),
        ),
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 85),
              child: Text(
                "Trip Plan",
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TripButton(texts: "Family Trip"),
                TripButton(texts: "Solo Trip"),
                TripButton(texts: "Adventure trekking"),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trip to Bali, Indonesia",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined,
                        size: 30,
                      ),
                      Text("July 23 2023 - July 31 2023",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Divider( // Add a horizontal line
                color: divider,
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.start,
              children: [
               Padding(
                  padding: const EdgeInsets.only(right: 12, left: 15),
                  child: TextButton(onPressed: (){
                    Navigator.of(context).pushReplacementNamed(TripPlanOverview.routeName);
                    },
                    child: const Text("Overview",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
               Padding(
                  padding: EdgeInsets.only(right: 12, left: 10,),
                  child: TextButton(onPressed: (){},
                    child: Text("Trip Plan",
                      style: TextStyle(
                        fontSize: 16,
                        color: buttons,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12, left: 10, top: 5, bottom:5),
                  child: TextButton(onPressed: (){},
                    child: const Text("Budget",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 16, top: 8,right: 16),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TripActivities(activity: "Day1: \n$day1",fontWeight: FontWeight.w400,),
                  TripActivities(activity: "Day2: \n$day2",fontWeight: FontWeight.w400,),
                  TripActivities(activity: "Day3: \n$day3",fontWeight: FontWeight.w400,),
                  TripActivities(activity: "Day4: \n$day4",fontWeight: FontWeight.w400,),
                  TripActivities(activity: "Day5: \n$day5",fontWeight: FontWeight.w400,),
                  TripActivities(activity: "Day6: \n$day6",fontWeight: FontWeight.w400,),
                  TripActivities(activity: "Day7: \n$day7",fontWeight: FontWeight.w400,),

                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}