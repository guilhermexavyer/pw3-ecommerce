import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/category_controller.dart';
import '../controllers/subcategory_controller.dart';
import '../models/category.dart';
import '../models/subcategory.dart';

class AddSubcategoryPopup extends StatefulWidget {
  @override
  _AddSubcategoryPopupState createState() => _AddSubcategoryPopupState();
}

class _AddSubcategoryPopupState extends State<AddSubcategoryPopup> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  Category? _selectedCategory;

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
            DropdownButtonFormField<Category>(
              decoration: InputDecoration(labelText: 'Categoria'),
              items: categories.map((category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
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
              final newSubCategory = Subcategory(
                id: 0,
                name: _name,
                categoryId: _selectedCategory!.id,
                category: _selectedCategory!,
              );
              Provider.of<SubcategoryController>(context, listen: false)
                  .addSubcategory(newSubCategory);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
