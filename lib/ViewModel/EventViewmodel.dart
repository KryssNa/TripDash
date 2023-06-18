
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Repositeries/event_repositories.dart';
import '../model/Event_Model.dart';


class EventViewModel with ChangeNotifier{
  EventRepository _eventRepository =EventRepository();
  Stream<QuerySnapshot<EventModel>>? _event;
  Stream<QuerySnapshot<EventModel>>? get event => _event;

  Future<void> getEvent() async{
    var response = _eventRepository.getData();
    _event = response as Stream<QuerySnapshot<EventModel>>?;
    notifyListeners();
  }
}