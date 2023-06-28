import 'package:flutter/material.dart';
    
class Booking extends StatefulWidget {
  static var routeName;

  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: Container(
    width: 375,
    height: 1076,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(color: Color(0xFFFCF8F6)),
    child: Stack(
        children: [
            Positioned(
                left: 36,
                top: 74,
                child: Transform(
                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-3.14),
                    child: Container(
                        width: 20,
                        height: 20,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Stack(children: [
                        
                        ]),
                    ),
                ),
            ),
            Positioned(
                left: 151,
                top: 54,
                child: Text(
                    'Booking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF16191C),
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 90,
                child: Text(
                    'Booking Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF16191C),
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 118,
                child: Container(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Package',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w200,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                            'Cox’s Bazar Beach ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 302,
                child: Container(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Passengers',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w200,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                            '2 Adults',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 486,
                child: Container(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Hotel & Resort',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w200,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                            '4 Star Hotel (Deluxe Room)',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 210,
                child: Container(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Duration',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w200,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                            '2 Days 3 Nights Package',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 394,
                child: Container(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Transport',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w200,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                            'Shyamoly Paribahan NR, Non-AC',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 578,
                child: Container(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Date',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w200,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                            '18 Mar - 22 Mar ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 20,
                                                letterSpacing: -0.11,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 698,
                child: Text(
                    'Cox’s Bazar Beach ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 275,
                top: 698,
                child: Text(
                    'NRs.4800',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 275,
                top: 779,
                child: Text(
                    'NRs.4800',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 275,
                top: 890,
                child: Text(
                    'NRs.4830',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 296,
                top: 807,
                child: Text(
                    'NRs.30',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 308,
                top: 835,
                child: Text(
                    'NRs.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 194,
                child: Container(
                    width: 343,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 286,
                child: Container(
                    width: 343,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 378,
                child: Container(
                    width: 343,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 470,
                child: Container(
                    width: 343,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 562,
                child: Container(
                    width: 343,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 762,
                child: Container(
                    width: 343,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 870,
                child: Container(
                    width: 343,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 662,
                child: Text(
                    'Payment Summary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 17,
                top: 726,
                child: Text(
                    '2xNRs2400',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w200,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 17,
                top: 806,
                child: Text(
                    'Services charges',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w200,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 17,
                top: 834,
                child: Text(
                    'Discounts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w200,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 779,
                child: Text(
                    'Sub Total',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 886,
                child: Text(
                    'Total',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                        height: 20,
                        letterSpacing: -0.11,
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 930,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 17),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                'Proceed to Checkout',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w500,
                                    height: 20,
                                    letterSpacing: -0.11,
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        ],
    ),
));
    ;
  }
}