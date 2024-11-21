import '../models/subcategory.dart';

class SubcategoryRepository {
  final List<Subcategory> _subCategories = [];
  int _nextId = 1;

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(Duration(milliseconds: 10));
  }

  Future<List<Subcategory>> fetchSubcategories() async {
    return List.from(_subCategories);
  }

  Future<Subcategory> createSubcategory(Subcategory subCategory) async {
    await _simulateNetworkDelay();
    subCategory.id = _nextId++;
    _subCategories.add(subCategory);

    return Subcategory(
      id: subCategory.id,
      name: subCategory.name,
      categoryId: subCategory.categoryId,
      category: subCategory.category,
    );
  }

  Future<void> deleteSubcategory(int id) async {
    await _simulateNetworkDelay();
    _subCategories.removeWhere((subCategory) => subCategory.id == id);
  }
}
