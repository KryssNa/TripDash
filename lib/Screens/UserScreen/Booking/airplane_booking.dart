import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AirplaneBooking extends StatefulWidget {
  const AirplaneBooking({Key? key}) : super(key: key);

  @override
  State<AirplaneBooking> createState() => _AirplaneBookingState();
}

class _AirplaneBookingState extends State<AirplaneBooking>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(_animation);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flights Booking",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3e7dc3),
        elevation: 0.0,
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          color: Colors.green[50],
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('AirplaneBooking').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<DocumentSnapshot> documents = snapshot.data!.docs;

              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot document = documents[index];
                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;

                  String name = data['name'] ?? '';
                  String seat = data['flight'] ?? '';
                  String price = data['price'] ?? '';

                  return FadeTransition(
                    opacity: _animation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        elevation: 4.0,
                        child: ListTile(
                          leading: const Icon(
                            Icons.place,
                            size: 32.0,
                            color: Colors.blue,
                          ),
                          title: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            seat,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          trailing: Text(
                            'Rs.$price',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
