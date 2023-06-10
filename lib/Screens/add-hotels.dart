import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class UserHotelScreen extends StatefulWidget {
  const UserHotelScreen({Key? key}) : super(key: key);
  static const routeName = '/UserHotelScreen';

  @override
  State<UserHotelScreen> createState() => _UserHotelScreenState();
}

class _UserHotelScreenState extends State<UserHotelScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late HotelViewModel _hotelViewModel;
  @override
  void initState(){
    _hotelViewModel = Provider.of<HotelViewModel>(context, listen: false);
    _hotelViewModel.getHotel();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var hotel =context.watch<HotelViewModel>().hotel;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: hotel,
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<HotelModel>> snapshot) {
                  if (snapshot.hasError) return Text("Error");
                  return Container(
                    margin: EdgeInsets.only(right: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...snapshot.data!.docs.map((document) {
                            HotelModel hotel = document.data();

                            return Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  hotel.imageUrl == null || hotel.imageUrl == ""? Image.asset("Assets/Images/Pokhara.jpg",
                                    height: 80,
                                    width: 310, fit: BoxFit.cover,) :
                                  Container(
                                    height: 180,
                                    width: 310,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(hotel.imageUrl.toString()),
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 310,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff1f1f1),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )),
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            hotel.hotelName.toString(),
                                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Color(0xffdf842b),
                                                size: 20,
                                              ),
                                              Container(
                                                width: 260,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      hotel.location.toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                    Text(
                                                      hotel.price.toString(),
                                                      style: TextStyle(
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
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}

class HotelViewModel with ChangeNotifier{
  get hotel => null;

  void getHotel() {}
}

class HotelModel {
  get location => null;

  get price => null;

  get hotelName => null;

  get imageUrl => null;
}





