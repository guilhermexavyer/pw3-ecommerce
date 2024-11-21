import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductController extends ChangeNotifier {
  final ProductService _service = ProductService();
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> loadProducts() async {
    try {
      _products = await _service.getProducts();
      notifyListeners();
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final addedProduct = await _service.addProduct(product);
      _products.add(addedProduct);
      notifyListeners();
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<void> removeProduct(int id) async {
    try {
      await _service.removeProduct(id);
      _products.removeWhere((product) => product.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting product: $e');
    }
  }
}
