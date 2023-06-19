
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tripdash/model/Hotel_Model.dart';

import '../Repositeries/hotel_repositories.dart';


class HotelViewModel with ChangeNotifier{
  HotelRepository _hotelRepository =HotelRepository();
  Stream<QuerySnapshot<HotelModel>>? _hotel;
  Stream<QuerySnapshot<HotelModel>>? get hotel => _hotel;

  Future<void> getHotel() async{
    var response = _hotelRepository.getData();
    _hotel = response as Stream<QuerySnapshot<HotelModel>>?;
    notifyListeners();
  }
}