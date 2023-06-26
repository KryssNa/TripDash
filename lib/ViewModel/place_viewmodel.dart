
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tripdash/Repositeries/place_repositories.dart';
import 'package:tripdash/model/place_model.dart';


class PlaceViewModel with ChangeNotifier{
  final PlaceRepository _placeRepository =PlaceRepository();
  Stream<QuerySnapshot<PlaceModel>>? _place;
  Stream<QuerySnapshot<PlaceModel>>? get place => _place;

  Future<void> getplace() async{
    var response = _placeRepository.getData();
    _place = response;
    notifyListeners();
  }

}