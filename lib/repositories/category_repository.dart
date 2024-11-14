import '../models/category.dart';

class CategoryRepository {
  final List<Category> _categories = [];

  // Busca todas as categorias
  Future<List<Category>> fetchCategories() async {
    return List.from(_categories); // Retorna uma cópia da lista de categorias
  }

  // Cria e adiciona uma nova categoria à lista
  Future<Category> createCategory(Category category) async {
    _categories.add(category);
    return category; // Retorna a categoria criada
  }

  // Remove uma categoria da lista pelo ID
  Future<void> deleteCategory(int id) async {
    _categories.removeWhere((category) => category.id == id);
  }
}
