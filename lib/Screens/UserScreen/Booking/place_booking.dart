import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlaceBooking extends StatefulWidget {
  const PlaceBooking({Key? key}) : super(key: key);

  @override
  State<PlaceBooking> createState() => _PlaceBookingState();
}

class _PlaceBookingState extends State<PlaceBooking> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(_animation);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Place Bookings",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.green[50],
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('PlaceBooking').snapshots(),
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
                String description = data['description'] ?? '';
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
                          color: Colors.green,
                        ),
                        title: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          description,
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
    );
  }
}
