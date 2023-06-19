
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Repositeries/ProductRepositories.dart';
import '../model/ProductModel.dart';


class ProductViewModel with ChangeNotifier{
  ProductRepository _productRepository = ProductRepository();
  Stream<QuerySnapshot<ProductModel>>? _product;
  Stream<QuerySnapshot<ProductModel>>? get product => _product;

  Future<void> getProduct() async{
    var response = _productRepository.getData();
    _product = response as Stream<QuerySnapshot<ProductModel>>?;
    notifyListeners();
  }
}