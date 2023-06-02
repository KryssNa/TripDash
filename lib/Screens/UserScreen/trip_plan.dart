import 'package:flutter/material.dart';

import '../../widget/TripPlanWidgets/trip_activiteis.dart';
import '../../widget/TripPlanWidgets/trip_buttons.dart';
import '../../widget/TripPlanWidgets/trip_images.dart';

class TripPlan extends StatefulWidget {
  const TripPlan({Key? key}) : super(key: key);

  @override
  State<TripPlan> createState() => _TripPlanState();
}

class _TripPlanState extends State<TripPlan> {
  Color divider = Color(int.parse("777F88", radix: 16)).withOpacity(1.0);
  Color buttons = Color(int.parse("FF6700", radix: 16)).withOpacity(1.0);
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
            Row(
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
                  padding: const EdgeInsets.only(right: 12, left: 15, top: 8, bottom:8),
                  child: Text("Overview",
                    style: TextStyle(
                      fontSize: 16,
                      color: buttons,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12, left: 10, top: 8, bottom:8),
                  child: Text("Trip Plan",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12, left: 10, top: 8, bottom:8),
                  child: Text("Budget",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                TripImages(imageAddress: "https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", edgeInsets: EdgeInsets.only(left: 15, top: 8, bottom: 10, right: 15), values: 185),
                TripImages(imageAddress: "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: EdgeInsets.only(top: 8, bottom: 10, right: 15, left: 0), values: 150)
              ],
            ),
            const Row(
              children: [
                TripImages(imageAddress: "https://images.unsplash.com/photo-1594471204420-0efa37bc6dc8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjV8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: const EdgeInsets.only(left: 15,  bottom: 10, right: 15, top: 0), values: 150),
                TripImages(imageAddress: "https://images.unsplash.com/photo-1592364395653-83e648b20cc2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60", edgeInsets: const EdgeInsets.only( bottom: 10, right: 15, top: 0, left: 0), values: 185),
              ],
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TripActivities(activity: "Duration: 7 days and 6 nights", fontWeight: FontWeight.w700),
                  TripActivities(activity: "Accomodations \nGoing like swimming pools, kids' clubs, and spacious rooms or villas.", fontWeight: FontWeight.w400),
                  TripActivities(activity: "Bull Fight \nStay at a family-friendly resort asd asd asd cwefjasdf aiosd wefwhef asdhfsdif with amenities like swimming pools, kids' clubs, and spacious rooms or villas.", fontWeight: FontWeight.w400),
                  TripActivities(activity: "Transport \nStay at a family-friendly resort with amenities  asdasd efdwjefi like swimming pools, kids' clubs, and spacious rooms or villas.", fontWeight: FontWeight.w400),
                  TripActivities(activity: "Sightseeing \nStay at a family-friendly resort  swimming pools, kids' clubs, and spacious rooms or villas.", fontWeight: FontWeight.w400),
                  TripActivities(activity: "Food \nswimming pools, kids' clubs, and spacious rooms or villas and there will be many more to explore you have to stay wiht us.", fontWeight: FontWeight.w400),
                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}