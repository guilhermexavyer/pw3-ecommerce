import 'package:flutter/material.dart';
import '../models/subcategory.dart';
import '../services/subcategory_service.dart';

class SubcategoryController extends ChangeNotifier {
  final SubcategoryService _service = SubcategoryService();
  List<Subcategory> _subcategories = [];

  List<Subcategory> get subcategories => _subcategories;

  Future<void> loadSubcategories() async {
    try {
      _subcategories = await _service.getSubcategories();
      notifyListeners();
    } catch (e) {
      print('Error loading subcategories: $e');
    }
  }

  Future<void> addSubcategory(Subcategory subcategory) async {
    try {
      final addedSubcategory = await _service.addSubcategory(subcategory);
      _subcategories.add(addedSubcategory);
      notifyListeners();
    } catch (e) {
      print('Error adding subcategory: $e');
    }
  }

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
