import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
  late placeViewModel _placeViewModel;
  @override
  void initState(){
    _placeViewModel = Provider.of<placeViewModel>(context, listen: false);
    _placeViewModel.getplace();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var place =context.watch<placeViewModel>().place;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: place,
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<placeModel>> snapshot) {
                  if (snapshot.hasError) return Text("Error");
                  return Container(
                    margin: EdgeInsets.only(right: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...snapshot.data!.docs.map((document) {
                            placeModel place = document.data();

                            return Container(
                              margin: EdgeInsets.only(right: 20),
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
                                            place.placeName.toString(),
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
                                                      place.location.toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                    Text(
                                                      place.price.toString(),
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

class placeViewModel with ChangeNotifier{
  get place => null;

  void getplace() {}
}

class placeModel {
  get location => null;

  get price => null;

  get placeName => null;

  get imageUrl => null;
}





