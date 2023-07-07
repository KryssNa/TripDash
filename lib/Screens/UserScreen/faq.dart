import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:tripdash/Screens/UserScreen/user_app_drawer.dart';

class FAQ extends StatelessWidget {
  static String routeName = "/FAQ";
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const UserAppDrawer(),
        appBar: AppBar(
          title: const Text("FAQ about Trip Dash"),
          centerTitle: true,
        ),
        body: Accordion(
          maxOpenSections: 1,
          headerBackgroundColor: const Color(0xFF7DB7DA),
          // headerTextStyle: TextStyle(
          //     color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          leftIcon: const Icon(Icons.question_answer, color: Colors.white),
          children: [
            AccordionSection(
              isOpen: false,
              header: const Text('How do I book a flight or hotel using the app?',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: const Text(
                  'To book a flight or hotel using our app, simply open the app and enter your destination and travel dates. Browse through the available options and select the one that suits your preferences. Follow the prompts to enter your personal details and payment information to complete the booking.'),
            ),
            AccordionSection(
              isOpen: false,
              header: const Text('Can I modify or cancel my booking through the app?',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: const Text(
                  "Yes, you can modify or cancel your booking through our app. Simply locate your booking in the 'My Bookings' section of the app and select the option to modify or cancel. Keep in mind that there may be certain restrictions or fees associated with modifications or cancellations, depending on the specific booking and the policies of the airline or hotel."),
            ),
            AccordionSection(
              isOpen: false,
              header: const Text('How can I find the best deals and discounts on flights and hotels?',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: const Text(
                  "Our app provides a variety of tools to help you find the best deals and discounts. You can set up price alerts for specific destinations or dates to receive notifications when prices drop. Additionally, our app often features exclusive deals and promotions that you can take advantage of. Make sure to check the 'Deals' section regularly to find great offers."),
            ),
            AccordionSection(
              isOpen: false,
              header: const Text('Is it possible to track my flights through the app?',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: const Text(
                  "Absolutely! Our app offers flight tracking functionality. You can enter your flight details, such as airline and flight number, or simply use your booking information to track your flight in real-time. You will receive updates on any delays, gate changes, or other relevant information regarding your flight.."),
            ),
            AccordionSection(
              isOpen: false,
              header: const Text('Can I use the app to explore popular attractions and find travel recommendations?',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: const Text(
                  "Yes, our app includes a comprehensive database of popular attractions, landmarks, and travel recommendations. You can search for specific destinations or browse through curated lists to discover exciting places to visit. The app also provides detailed information about each attraction, including opening hours, reviews, and directions to help you plan your itinerary."),
            ),
          ],
        ),
      ),
    );
  }
}
