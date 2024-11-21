import '../models/subcategory.dart';
import '../repositories/subcategory_repository.dart';

class SubcategoryService {
  final SubcategoryRepository _repository = SubcategoryRepository();

  Future<List<Subcategory>> getSubcategories() {
    return _repository.fetchSubcategories();
  }

  Future<Subcategory> addSubcategory(Subcategory subcategory) {
    return _repository.createSubcategory(subcategory);
  }

  Future<void> removeSubcategory(int id) {
    return _repository.deleteSubcategory(id);
  }
}
