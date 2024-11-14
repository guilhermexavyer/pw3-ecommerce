import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controller.dart';
import '../controllers/category_controller.dart'; // Controlador para carregar as categorias
import '../models/product.dart';
import '../models/subcategory.dart';
import '../models/category.dart';

class AddProductPopup extends StatefulWidget {
  @override
  _AddProductPopupState createState() => _AddProductPopupState();
}

class _AddProductPopupState extends State<AddProductPopup> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _price = 0.0;
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
      title: Text('Adicionar Produto'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome do Produto'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome do produto';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Preço do Produto'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || double.tryParse(value) == null) {
                  return 'Informe um preço válido';
                }
                return null;
              },
              onSaved: (value) {
                _price = double.parse(value!);
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
              final newProduct = Product(
                id: 0,
                name: _name,
                price: _price,
                subCategoryId: _selectedCategoryId!,
                subCategory: SubCategory(
                  id: _selectedCategoryId!,
                  name: '',
                  categoryId: _selectedCategoryId!,
                  category: categories
                      .firstWhere((cat) => cat.id == _selectedCategoryId!),
                ),
              );
              Provider.of<ProductController>(context, listen: false)
                  .addProduct(newProduct);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
