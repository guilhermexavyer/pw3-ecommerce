import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/subcategory_controller.dart';
import '../controllers/category_controller.dart';
import '../models/subcategory.dart';
import '../models/category.dart';

class AddSubcategoryPopup extends StatefulWidget {
  @override
  _AddSubcategoryPopupState createState() => _AddSubcategoryPopupState();
}

class _AddSubcategoryPopupState extends State<AddSubcategoryPopup> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoryController>(context, listen: false).loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryController>(context).categories;

    return AlertDialog(
      title: Text('Adicionar Subcategoria'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome da Subcategoria'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome da subcategoria';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            DropdownButtonFormField<int>(
              decoration: InputDecoration(labelText: 'Categoria'),
              items: categories.map((Category category) {
                return DropdownMenuItem<int>(
                  value: category.id,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategoryId = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Selecione uma categoria';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Adicionar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final selectedCategory =
                  categories.firstWhere((cat) => cat.id == _selectedCategoryId);
              final newSubcategory = SubCategory(
                id: 0,
                name: _name,
                categoryId: _selectedCategoryId!,
                category: selectedCategory,
              );
              Provider.of<SubcategoryController>(context, listen: false)
                  .addSubcategory(newSubcategory);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
