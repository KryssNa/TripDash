import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/Services/firebase_service.dart';
import 'package:tripdash/model/place_model.dart';

class PlaceRepository{
  CollectionReference<PlaceModel> ref =
  FirebaseService.db.collection("place")
      .withConverter<PlaceModel>(
    fromFirestore: (snapshot, _) {
      return PlaceModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Stream<QuerySnapshot<PlaceModel>> getData()  {
    Stream<QuerySnapshot<PlaceModel>> response = ref
        .snapshots();
    return response;
  }


  Future<List<QueryDocumentSnapshot<PlaceModel>>> getDataNormal() async {
    QuerySnapshot<PlaceModel> response = await ref.get();

    return response.docs;
  }
  Future<PlaceModel?> getOneData(String id) async {
    DocumentSnapshot<PlaceModel> response = await ref.doc(id).get();
    return response.data();
  }


  Future<bool> addplace(PlaceModel data) async {
    await ref.add(data);
    return true;
  }
}