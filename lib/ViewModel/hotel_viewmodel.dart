
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tripdash/Repositeries/hotel_repositories.dart';
import 'package:tripdash/model/hotel_model.dart';


class HotelViewModel with ChangeNotifier{
  final HotelRepository _hotelRepository =HotelRepository();
  Stream<QuerySnapshot<HotelModel>>? _hotel;
  Stream<QuerySnapshot<HotelModel>>? get hotel => _hotel;

  Future<void> getHotel() async{
    var response = _hotelRepository.getData();
    _hotel = response;
    notifyListeners();
  }
}