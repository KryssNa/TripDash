import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/ProductModel.dart';
import '../services/firebase_service.dart';

class ProductRepository{
  CollectionReference<ProductModel> ref =
  FirebaseService.db.collection("product")
      .withConverter<ProductModel>(
    fromFirestore: (snapshot, _) {
      return ProductModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Stream<QuerySnapshot<ProductModel>> getData()  {
    Stream<QuerySnapshot<ProductModel>> response = ref
        .snapshots();
    return response;
  }
  Future<ProductModel?> getOneData(String id) async {
    DocumentSnapshot<ProductModel> response = await ref.doc(id).get();
    return response.data();
  }


  Future<bool> addHotel(ProductModel data) async {
    await ref.add(data);
    return true;
  }
}