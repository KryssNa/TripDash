
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Repositeries/product_repositories.dart';
import '../model/product_model.dart';


class ProductViewModel with ChangeNotifier{
  final ProductRepository _productRepository = ProductRepository();
  Stream<QuerySnapshot<ProductModel>>? _product;
  Stream<QuerySnapshot<ProductModel>>? get product => _product;

  Future<void> getProduct() async{
    var response = _productRepository.getData();
    _product = response;
    notifyListeners();
  }
}