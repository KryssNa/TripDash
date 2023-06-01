import 'package:flutter/material.dart';

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
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 85),
              child: Text(
                "Trip Plan",
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
                ElevatedButton(
                  onPressed:(){

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttons)
                  ),
                  child: const Text("Family Trip",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed:(){

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttons)
                  ),
                  child: const Text("Solo Trip",
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
                ElevatedButton(
                  onPressed:(){

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttons)
                  ),
                  child: const Text("Adventure trekking",
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 8, bottom: 10, right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network("https://images.unsplash.com/photo-1501179691627-eeaa65ea017c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aW5kb25lc2lhfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
                      fit: BoxFit.fitWidth,
                      height: 100,
                      width: 185,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 10, right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network("https://images.unsplash.com/photo-1544644181-1484b3fdfc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
                      fit: BoxFit.fill,
                      height: 100,
                      width: 150,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15,  bottom: 10, right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network("https://images.unsplash.com/photo-1594471204420-0efa37bc6dc8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjV8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
                      fit: BoxFit.fill,
                      height: 100,
                      width: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( bottom: 10, right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network("https://images.unsplash.com/photo-1592364395653-83e648b20cc2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fGluZG9uZXNpYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
                      fit: BoxFit.fill,
                      height: 100,
                      width: 185,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8,bottom: 8),
                    child: Text("Duration: 7 days and 6 nights",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, right: 10),
                    child: Text("Accomodations \nGoing like swimming pools, kids' clubs, and spacious rooms or villas.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 8),
                    child: Text("Bull Fight \nStay at a family-friendly resort asd asd asd cwefjasdf aiosd wefwhef asdhfsdif with amenities like swimming pools, kids' clubs, and spacious rooms or villas.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 8),
                    child: Text("Transport \nStay at a family-friendly resort with amenities  asdasd efdwjefi like swimming pools, kids' clubs, and spacious rooms or villas.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 8),
                    child: Text("Sightseeing \nStay at a family-friendly resort  swimming pools, kids' clubs, and spacious rooms or villas.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 8),
                    child: Text("Food \nswimming pools, kids' clubs, and spacious rooms or villas and there will be many more to explore you have to stay wiht us.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}