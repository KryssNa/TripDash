import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHotelScreen extends StatefulWidget {
  const UserHotelScreen({Key? key}) : super(key: key);
  static const routeName = '/UserHotelScreen';

  @override
  State<UserHotelScreen> createState() => _UserHotelScreenState();
}

class _UserHotelScreenState extends State<UserHotelScreen> {
  late HotelViewModel _hotelViewModel;

  @override
  void initState() {
    super.initState();
    _hotelViewModel = Provider.of<HotelViewModel>(context, listen: false);
    _hotelViewModel.getHotel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot<HotelModel>>(
              stream: _hotelViewModel.hotel,
              builder: (context, snapshot) {
                if (snapshot.hasError) return const Text("Error");
                if (!snapshot.hasData) return const CircularProgressIndicator();
                final hotels = snapshot.data!.docs.map((doc) => doc.data()).toList();
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...hotels.map((hotel) => Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              hotel.imageUrl == ""
                                  ? Image.asset(
                                "Assets/Images/Pokhara.jpg",
                                height: 80,
                                width: 310,
                                fit: BoxFit.cover,
                              )
                                  : Container(
                                height: 180,
                                width: 310,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(hotel.imageUrl.toString()),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 310,
                                decoration: const BoxDecoration(
                                  color: Color(0xfff1f1f1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hotel.hotelName.toString(),
                                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Color(0xffdf842b),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 260,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  hotel.location.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  hotel.price.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HotelViewModel with ChangeNotifier {
  late Stream<QuerySnapshot<HotelModel>> hotel;

  void getHotel() {
    // Replace the code below with your own logic to fetch hotels from Firestore
    hotel = FirebaseFirestore.instance.collection('hotels').snapshots() as Stream<QuerySnapshot<HotelModel>>;
  }
}

class HotelModel {
  late String location;
  late double price;
  late String hotelName;
  late String imageUrl;
}
