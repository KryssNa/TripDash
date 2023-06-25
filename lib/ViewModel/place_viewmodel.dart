
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tripdash/model/PlaceModel.dart';

import '../Repositeries/place_repositories.dart';


class placeViewModel with ChangeNotifier{
  PlaceRepository _placeRepository =PlaceRepository();
  Stream<QuerySnapshot<PlaceModel>>? _place;
  Stream<QuerySnapshot<PlaceModel>>? get place => _place;

  Future<void> getplace() async{
    var response = _placeRepository.getData();
    _place = response as Stream<QuerySnapshot<PlaceModel>>?;
    notifyListeners();
  }

}