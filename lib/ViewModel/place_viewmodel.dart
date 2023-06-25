
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Repositeries/place_repositories.dart';
import '../Screens/add-places.dart';


class placeViewModel with ChangeNotifier{
  PlaceRepository _placeRepository =PlaceRepository();
  Stream<QuerySnapshot<placeModel>>? _place;
  Stream<QuerySnapshot<placeModel>>? get place => _place;

  Future<void> getplace() async{
    var response = _placeRepository.getData();
    _place = response as Stream<QuerySnapshot<placeModel>>?;
    notifyListeners();
  }

}