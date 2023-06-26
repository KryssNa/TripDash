import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/Services/firebase_service.dart';
import 'package:tripdash/model/hotel_model.dart';


class HotelRepository{
  CollectionReference<HotelModel> ref =
  FirebaseService.db.collection("hotel")
      .withConverter<HotelModel>(
    fromFirestore: (snapshot, _) {
      return HotelModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Stream<QuerySnapshot<HotelModel>> getData()  {
    Stream<QuerySnapshot<HotelModel>> response = ref
        .snapshots();
    return response;
  }
  
  Future<List<QueryDocumentSnapshot<HotelModel>>> getDataNormal() async {
    QuerySnapshot<HotelModel> response = await ref.get();
    
    return response.docs;
  }
  Future<HotelModel?> getOneData(String id) async {
    DocumentSnapshot<HotelModel> response = await ref.doc(id).get();
    return response.data();
  }


  Future<bool> addHotel(HotelModel data) async {
    await ref.add(data);
    return true;
  }
}