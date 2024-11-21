import '../models/product.dart';

class ProductRepository {
  final List<Product> _products = [];
  int _nextId = 1;

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(Duration(milliseconds: 10));
  }

  Future<List<Product>> fetchProducts() async {
    return List.from(_products);
  }

  Future<Product> createProduct(Product product) async {
    await _simulateNetworkDelay();
    product.id = _nextId++;
    _products.add(product);

    return Product(
      id: product.id,
      name: product.name,
      price: product.price,
      subCategoryId: product.subCategoryId,
      subCategory: product.subCategory,
    );
  }

  Future<void> deleteProduct(int id) async {
    await _simulateNetworkDelay();
    _products.removeWhere((product) => product.id == id);
  }
}
