import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserplaceScreen extends StatefulWidget {
  const UserplaceScreen({Key? key}) : super(key: key);
  static const routeName = '/UserplaceScreen';

  @override
  State<UserplaceScreen> createState() => _UserplaceScreenState();
}

class _UserplaceScreenState extends State<UserplaceScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late PlaceViewModel _placeViewModel;
  @override
  void initState(){
    _placeViewModel = Provider.of<PlaceViewModel>(context, listen: false);
    _placeViewModel.getplace();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var place =context.watch<PlaceViewModel>().place;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: place,
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<PlaceModel>> snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  return Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...snapshot.data!.docs.map((document) {
                            PlaceModel place = document.data();

                            return Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  place.imageUrl == null || place.imageUrl == ""? Image.asset("Assets/Images/Pokhara.jpg",
                                    height: 80,
                                    width: 310, fit: BoxFit.cover,) :
                                  Container(
                                    height: 180,
                                    width: 310,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(place.imageUrl.toString()),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 310,
                                    decoration: const BoxDecoration(
                                        color: Color(0xfff1f1f1),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            place.placeName.toString(),
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
                                                      place.location.toString(),
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                    Text(
                                                      place.price.toString(),
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

class PlaceViewModel with ChangeNotifier{
  get place => null;

  void getplace() {}
}

class PlaceModel {
  get location => null;

  get price => null;

  get placeName => null;

  get imageUrl => null;
}





