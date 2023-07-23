import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_store/model/product_response_model.dart';

class HomeViewModel with ChangeNotifier {
  bool isloading = false;

  List<ProductResponseModel> _cartResponseData = [];
  List get myCartLists => _cartResponseData;

  List<ProductResponseModel> productResponseData = [];

  void addToCart(items) {
    _cartResponseData.add(items);

    notifyListeners();
    print(_cartResponseData.first.title);
    print(_cartResponseData.length);
  }

  void removeFromCart(items) {
    _cartResponseData.remove(items);
    notifyListeners();
  }

  Future<void> getProduct() async {
    isloading = true;
    notifyListeners();

    try {
      Response response = await Dio().get("https://fakestoreapi.com/products");

      List<ProductResponseModel> products =
          []; // Create a list to store products

      for (var data in response.data) {
        products.add(ProductResponseModel.fromJson(data));
      }

      productResponseData = products; // Assign the list to productResponseData

      notifyListeners();
    } catch (e) {
      print("error: $e");
    }

    isloading = false;
    notifyListeners();
  }
}
