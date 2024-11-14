import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/subcategory_controller.dart'; // Importa o controlador de subcategorias
import '../widgets/subcategory_card.dart'; // Importa o widget SubCategoryCard
import 'add_subcategory_popup.dart'; // Importa a tela de pop-up para adicionar novas subcategorias

class SubCategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subcategorias"),
      ),
      body: Stack(
        children: [
          Consumer<SubcategoryController>(
            builder: (context, controller, child) {
              if (controller.subcategories.isEmpty) {
                return const Center(
                    child: Text("Nenhuma subcategoria cadastrada"));
              }
              return ListView.builder(
                itemCount: controller.subcategories.length,
                itemBuilder: (context, index) {
                  return SubCategoryCard(
                    subCategory: controller.subcategories[index],
                  ); // Exibe cada subcategoria usando SubCategoryCard
                },
              );
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddSubCategoryPopup(); // Widget responsável por adicionar novas subcategorias
                  },
                );
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
