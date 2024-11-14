import '../models/subcategory.dart';
import '../repositories/subcategory_repository.dart';

class SubcategoryService {
  final SubCategoryRepository _repository = SubCategoryRepository();

  Future<List<SubCategory>> getSubcategories() async {
    return await _repository.fetchSubCategories();
  }

  Future<SubCategory> addSubcategory(SubCategory subcategory) async {
    return await _repository.createSubCategory(subcategory);
  }

  Future<void> removeSubcategory(int id) async {
    await _repository.deleteSubCategory(id);
  }
}
