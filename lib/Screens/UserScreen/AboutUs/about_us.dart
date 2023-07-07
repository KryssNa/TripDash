import 'package:flutter/material.dart';

//About Us
class AboutUs extends StatefulWidget {
  static String routeName = "/AboutUs";
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
        toolbarHeight: 200,
        backgroundColor: Colors.blue[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        centerTitle: true,
        flexibleSpace: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image:  const AssetImage("Assets/images/yatra.png"),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.transparent.withOpacity(0), BlendMode.darken)

            )
          )
        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("TripDash",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 22),),
          Image.asset(
            'Assets/images/moj.jpg', // Replace with your image path
            height: 270,
            

          ),

          const SizedBox(height: 20),
          const Text(
            "TripDash is a trip planning application designed to transform your travel experiences. Our team of passionate travelers and tech enthusiasts have come together to create an app that simplifies and enhances every aspect of your journey. Elevate your travel experiences with the Travel App and unlock a world of convenience, discovery, and unforgettable adventures.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
