
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tripdash/Repositeries/event_repositories.dart';
import 'package:tripdash/model/event_model.dart';


class EventViewModel with ChangeNotifier{
  final EventRepository _eventRepository =EventRepository();
  Stream<QuerySnapshot<EventModel>>? _event;
  Stream<QuerySnapshot<EventModel>>? get event => _event;

  Future<void> getEvent() async{
    var response = _eventRepository.getData();
    _event = response;
    notifyListeners();
  }
}