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
        ],
    ),
)),
    );
  }
}