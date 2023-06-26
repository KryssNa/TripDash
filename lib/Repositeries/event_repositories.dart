import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/event_model.dart';
import '../services/firebase_service.dart';

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


  Future<bool> addEvent(EventModel data) async {
    await ref.add(data);
    return true;
  }
}