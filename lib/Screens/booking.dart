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
        width:375,
        height :1076,
        clipBehavior:Clip.antiAlias,
        decoration: BoxDecoration(color:Color(0xFFFCF8F6)),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 375,
                height: 45.83,
                child: Stack(
                  children: [
                    Positioned(
                      left: 334.38,
                      top: 17.71,
                      child: Container(
                        width: 25.52,
                        height: 11.98,
                        child: Stack(children: [
                          ,
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}