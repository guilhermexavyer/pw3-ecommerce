import 'package:flutter/material.dart';
import '../models/subcategory.dart'; // Importa a classe SubCategory
import '../services/subcategory_service.dart'; // Serviço para gerenciar subcategorias

class SubcategoryController extends ChangeNotifier {
  final SubcategoryService _service = SubcategoryService();
  List<SubCategory> _subcategories =
      []; // Mudança de Subcategory para SubCategory

  List<SubCategory> get subcategories => _subcategories;

  // Função para carregar as subcategorias
  Future<void> loadSubcategories() async {
    try {
      _subcategories = await _service.getSubcategories();
      notifyListeners();
    } catch (e) {
      print('Error loading subcategories: $e');
    }
  }

  // Função para adicionar uma nova subcategoria
  Future<void> addSubcategory(SubCategory subcategory) async {
    // Ajuste para SubCategory
    try {
      final addedSubcategory = await _service.addSubcategory(subcategory);
      _subcategories.add(addedSubcategory);
      notifyListeners();
    } catch (e) {
      print('Error adding subcategory: $e');
    }
  }

  // Função para remover uma subcategoria
  Future<void> removeSubcategory(int id) async {
    try {
      await _service.removeSubcategory(id);
      _subcategories.removeWhere((subcategory) => subcategory.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting subcategory: $e');
    }
  }
}
