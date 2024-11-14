import 'package:ecommerce_front/repositories/category_repository.dart';

import '../models/subcategory.dart';
import '../models/category.dart';

class SubCategoryRepository {
  final List<SubCategory> _subCategories = [];

  // Simula a latência de uma chamada a um backend
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(Duration(seconds: 1)); // Simula um atraso de 1 segundo
  }

  // Busca todas as subcategorias, incluindo suas categorias
  Future<List<SubCategory>> fetchSubCategories() async {
    return List.from(
        _subCategories); // Retorna uma cópia da lista de subcategorias
  }

  Future<SubCategory> createSubCategory(SubCategory subCategory) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _subCategories.add(subCategory);

    // Busca a categoria correspondente usando o CategoryRepository
    final category = CategoryRepository().fetchCategories().then((categories) {
      return categories.firstWhere(
        (cat) => cat.id == subCategory.categoryId,
        orElse: () => Category(id: 0, name: 'sem categoria'),
      );
    });

    // Retorna a subcategoria com a categoria associada
    return SubCategory(
        id: subCategory.id,
        name: subCategory.name,
        categoryId: 1,
        category: await category);
  }

  // Remove uma subcategoria da lista pelo ID
  Future<void> deleteSubCategory(int id) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _subCategories.removeWhere((subCategory) => subCategory.id == id);
  }

  // Adiciona uma nova categoria à lista
}
