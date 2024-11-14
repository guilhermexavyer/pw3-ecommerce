// screens/subcategory_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/subcategory_controller.dart'; // Importa o controlador de subcategorias
import '../widgets/subcategory_card.dart'; // Importa o widget SubcategoryCard
import 'add_subcategory_popup.dart'; // Importa a tela de pop-up para adicionar novas subcategorias

class SubcategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<SubcategoryController>(context, listen: false);
    controller
        .loadSubcategories(); // Carrega a lista de subcategorias ao construir a tela

    return Stack(
      children: [
        Consumer<SubcategoryController>(
          builder: (context, controller, child) {
            // Exibe uma mensagem centralizada se a lista de subcategorias estiver vazia
            if (controller.subcategories.isEmpty) {
              return const Center(
                  child: Text("Nenhuma subcategoria cadastrada"));
            }
            // Caso contrário, exibe uma ListView das subcategorias
            return ListView.builder(
              itemCount: controller
                  .subcategories.length, // Número de subcategorias na lista
              itemBuilder: (context, index) {
                return SubcategoryCard(
                  subcategory: controller.subcategories[
                      index], // Exibe cada subcategoria usando SubcategoryCard
                );
              },
            );
          },
        ),
        // Botão flutuante adicionado ao Stack
        Positioned(
          bottom: 16, // Distância da parte inferior da tela
          right: 16, // Distância do lado direito da tela
          child: FloatingActionButton(
            onPressed: () {
              // Exibe o pop-up de adicionar subcategoria ao pressionar o botão
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddSubcategoryPopup(); // Widget responsável por adicionar novas subcategorias
                },
              );
            },
            child: Icon(Icons.add), // Ícone '+' para adicionar subcategorias
            backgroundColor:
                Colors.blue, // Define a cor de fundo do botão como azul
          ),
        ),
      ],
    );
  }
}
