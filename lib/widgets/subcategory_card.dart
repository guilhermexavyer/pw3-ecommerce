import 'package:flutter/material.dart';
import '../models/subcategory.dart';
import 'package:provider/provider.dart';
import '../controllers/subcategory_controller.dart';

class SubcategoryCard extends StatelessWidget {
  final SubCategory subcategory;

  SubcategoryCard({required this.subcategory})
      : super(key: ValueKey(subcategory.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(subcategory.name),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            Provider.of<SubcategoryController>(context, listen: false)
                .removeSubcategory(subcategory.id);
          },
        ),
      ),
    );
  }
}
