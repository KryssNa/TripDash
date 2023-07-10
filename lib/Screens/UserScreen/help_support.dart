import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HelpSupportPage(),
  ));
}




class HelpSupportPage extends StatefulWidget {
  static var routeName = "uyg";

  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  String? selectedQuestion;

  @override
  Widget build(BuildContext context) {
    final double fem = MediaQuery.of(context).size.width / 1000;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help and Support'),
      ),
      body: Container(
        padding: EdgeInsets.all(30 * fem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(200 * fem),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(25 * fem),
              ),
              child: Column(
                children: [
                  Text(
                    'How can we help you?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70 * fem,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20 * fem),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(40 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3 * fem,
                          offset: Offset(0, 2 * fem),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Paying for Reservation',
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 40 * fem,
                          horizontal: 16 * fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80 * fem),
            Text(
              'Paying for Reservation',
              style: TextStyle(
                color: Colors.black,
                fontSize: 80 * fem,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20 * fem),
            Expanded(
              child: ListView(
                children: [
                  buildQuestionButton(
                    'How do I cancel my reservation?',
                    '1. Go to booking \n2. Look for the reservation you      want to cancel \n3. Select it \n4. Finally Cancel it..',

                  ),
                  buildQuestionButton(
                    'What are the payment options?',
                    'Any Wallet that is available.',
                  ),
                  buildQuestionButton(
                    'How can I request a refund?',
                    'Contact us via email for customer care.',
                  ),
                  buildQuestionButton(
                    'Is there a cancellation fee?',
                    'No there is not.',
                  ),
                  buildQuestionButton(
                    'Can I change my payment method?',
                    'Yes, you can through payment options.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 30 * fem),
            selectedQuestion != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Answer:',
                  style: TextStyle(
                    fontSize: 40 * fem,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10 * fem),
                Text(
                  selectedQuestion!,
                  style: TextStyle(
                    fontSize: 60 * fem,
                    color: Colors.black87,
                  ),
                ),
              ],
            )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildQuestionButton(String question, String answer) {
    final double fem = MediaQuery.of(context).size.width / 1000;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedQuestion = answer;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 25 * fem),
        padding: EdgeInsets.all(60 * fem),
        decoration: BoxDecoration(
          color: Colors.deepOrange[200],
          borderRadius: BorderRadius.circular(25 * fem),
        ),
        child: Text(
          question,
          style: TextStyle(
            fontSize: 45 * fem,
          ),
        ),
      ),
    );
  }
}
