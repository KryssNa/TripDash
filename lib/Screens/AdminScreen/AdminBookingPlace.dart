import 'package:flutter/material.dart';

class AdminBookingPlace extends StatefulWidget {
  const AdminBookingPlace({Key? key}) : super(key: key);

  @override
  State<AdminBookingPlace> createState() => _AdminBookingPlaceState();
}

class _AdminBookingPlaceState extends State<AdminBookingPlace>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  // Sample list of bookings
  List<Map<String, dynamic>> bookings = [
    {
      'id': '1',
      'user': 'John Doe',
      'place': 'Place A',
      'date': '2023-07-18',
    },
    {
      'id': '2',
      'user': 'Jane Smith',
      'place': 'Place B',
      'date': '2023-07-19',
    },
    {
      'id': '3',
      'user': 'Bob Johnson',
      'place': 'Place C',
      'date': '2023-07-20',
    },
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Bookings'),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (BuildContext context, int index) {
                  final booking = bookings[index];
                  return ListTile(
                    title: Text(
                      'Booking ID: ${booking['id']}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User: ${booking['user']}',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Place: ${booking['place']}',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Date: ${booking['date']}',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
