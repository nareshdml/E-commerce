import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../product_response_model.dart';

class EcommerceItemsProvider with ChangeNotifier {
  final List<ProductResponseModel> _myCartList = []; // to store cart data
  List get myCartLists => _myCartList;
  int get count => _myCartList.length;

  double _price = 0.0;

  List<ProductResponseModel> _apiDataList = []; // to store api data
  List<ProductResponseModel> get apiDataList => _apiDataList;

  //add items and price to cart
  void addItem(items) {
    _myCartList.add(items);
    _price += items.price;
    notifyListeners();
  }

//removes items and price from cart
  void removeItems(items) {
    _myCartList.remove(items);
    _price -= items.price;
    notifyListeners();
  }

  String get totalprice {
    return _price.toStringAsFixed(2); // . pachadi 2 ota digit linxa
  }

  // for api get method
  Future<void> fetchData() async {
    try {
      Response response = await Dio().get("/products");
      List<ProductResponseModel> apiData = [];
      for (var item in response.data) {
        apiData.add(ProductResponseModel.fromJson(item));
      }
      _apiDataList = apiData;
    } on DioError catch (error) {
      print(error);
    }
  }
}
