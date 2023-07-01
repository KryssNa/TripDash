import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/Services/firebase_service.dart';
import 'package:tripdash/model/event_model.dart';

class EventRepository{
  CollectionReference<EventModel> ref =
  FirebaseService.db.collection("event")
      .withConverter<EventModel>(
    fromFirestore: (snapshot, _) {
      return EventModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Stream<QuerySnapshot<EventModel>> getData()  {
    Stream<QuerySnapshot<EventModel>> response = ref
        .snapshots();
    return response;
  }
  Future<EventModel?> getOneData(String id) async {
    DocumentSnapshot<EventModel> response = await ref.doc(id).get();
    return response.data();
  }
  Future<List<QueryDocumentSnapshot<EventModel>>> getDataNormal() async {
    QuerySnapshot<EventModel> response = await ref.get();
    
    return response.docs;
  }


  Future<bool> addEvent(EventModel data) async {
    await ref.add(data);
    return true;
  }
}