import 'package:ecommerce_app/data/data/repositories/product_repo.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CatagoryProvider extends ChangeNotifier {
  final ProductRepo productRepo;
  CatagoryProvider({required this.productRepo});


  bool isLoading = false;
  List<Product> catagory = [];

  get catagories => null;

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();
    final result = await productRepo.fetchProducts();
    catagory = result.products ?? [];
    isLoading = false;
    notifyListeners();
  }
}
