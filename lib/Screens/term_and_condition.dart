
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});
  static const routeName = '/TermsAndConditionsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Terms and Conditions',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions for TripDash',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,
                  color: Color(
                  0xFF08234D)),
            ),
            SizedBox(height: 10.0),
            Text(
              'By accessing and using TripDash, you acknowledge that you have read, understood, and agree to be bound by this Agreement. If you do not agree to these terms, you may not use the App.\n\n'
                  'TripDash is a travel assistance application that provides travel-related information, itineraries, and suggestions. The information provided is for general guidance purposes only and should not be considered as professional advice.\n\n'
                  'You are solely responsible for any actions or decisions you make based on the information provided by the App. We do not guarantee the accuracy, completeness, or reliability of the information presented.\n\n'
                  'To access certain features of TripDash, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account credentials and are liable for any activities conducted through your account.\n\n'
                  'You must provide accurate and up-to-date information during the registration process. If any information provided is found to be false or misleading, we reserve the right to suspend or terminate your account.\n\n'
                  'We value your privacy and are committed to protecting your personal information. By using the App, you agree to the collection, use, and disclosure of your data as described in our Privacy Policy. Please review our Privacy Policy to understand how we handle your personal information.\n\n'
                  'You agree not to use TripDash for any unlawful, abusive, or unauthorized purposes. This includes but is not limited to:\n'
                  '  - Uploading, sharing, or transmitting any content that is harmful, offensive, or violates the rights of others.\n'
                  '  - Engaging in any form of unauthorized data mining, scraping, or harvesting.\n'
                  '  - Attempting to interfere with the App\'s functionality, security, or integrity.\n'
                  'We reserve the right to suspend or terminate your access to the App if we believe you are engaging in any prohibited activities.\n\n'
                  'All content, including but not limited to text, graphics, images, logos, and software used in the App, are the intellectual property of [Your Company Name] or its licensors. You may not use, reproduce, modify, or distribute any of the content without prior written consent from us.\n\n'
                  'By submitting any content to TripDash, you grant us a non-exclusive, worldwide, royalty-free license to use, reproduce, and distribute that content for the purpose of providing the App\'s services.\n\n'
                  'TripDash is provided on an "as-is" basis without any warranties, expressed or implied. We do not guarantee that the App will be error-free, uninterrupted, or secure. We disclaim all warranties, including but not limited to warranties of accuracy, fitness for a particular purpose, and non-infringement.\n\n'
                  'In no event shall [Your Company Name] or its affiliates be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with your use of TripDash. We shall not be liable for any loss or damage caused by any third-party content, advertisements, or services accessed through the App.\n\n'
                  'We reserve the right to modify this Agreement at any time without prior notice. The updated terms will be posted on TripDash, and your continued use of the App after the changes will constitute your acceptance of the revised Agreement.\n\n'
                  'This Agreement shall be governed by and construed in accordance with the laws of [Your Country/State/Region], without regard to its conflicts of law principles.\n\n'
                  'If you have any questions or concerns about these Terms and Conditions, please contact us at [Your Contact Email Address].\n\n'
                  'By using TripDash, you signify your agreement to these Terms and Conditions. If you do not agree to these terms, please refrain from using the App.',
              style: TextStyle(fontSize: 16.0),
            ),

            SizedBox(height: 20.0),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(
                  0xFF08234D)),
            ),
            SizedBox(height: 10.0),
            Text(
              'If you have any questions or concerns about these Terms and Conditions, please contact us at TripDash@help.np ',
              style: TextStyle(fontSize: 16.0),
            ),

            SizedBox(height: 20.0),
            Text(
              'Changes to This Agreement',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(
                  0xFF08234D)),
            ),
            SizedBox(height: 10.0),
            Text(
              'We reserve the right to modify this Agreement at any time without prior notice. The updated terms will be posted on TripDash, and your continued use of the App after the changes will constitute your acceptance of the revised Agreement.',
              style: TextStyle(fontSize: 16.0),
            ),

            SizedBox(height: 20.0),
            Text(
              'Governing Law',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(
                  0xFF08234D)),
            ),
            SizedBox(height: 10.0),
            Text(
              'This Agreement shall be governed by and construed in accordance with the laws of Nepal, without regard to its conflicts of law principles.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}