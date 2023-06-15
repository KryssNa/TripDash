import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/Place_Model.dart';
import '../services/firebase_service.dart';

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
  Future<PlaceModel?> getOneData(String id) async {
    DocumentSnapshot<PlaceModel> response = await ref.doc(id).get();
    return response.data();
  }


  Future<bool> addPlace(PlaceModel data) async {
    await ref.add(data);
    return true;
  }
}