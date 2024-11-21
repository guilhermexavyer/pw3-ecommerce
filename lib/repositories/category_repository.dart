import '../models/category.dart';

class CategoryRepository {
  static final List<Category> _categories = [];
  static int _nextId = 1;

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(Duration(milliseconds: 10));
  }

  Future<List<Category>> fetchCategories() async {
    await _simulateNetworkDelay();
    return List.from(_categories);
  }

  Future<Category> createCategory(Category category) async {
    await _simulateNetworkDelay();
    category.id = _nextId++;
    _categories.add(category);
    return category;
  }

  Future<void> deleteCategory(int id) async {
    await _simulateNetworkDelay();
    _categories.removeWhere((category) => category.id == id);
  }
}
