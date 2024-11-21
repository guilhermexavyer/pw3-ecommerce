import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_role_popup.dart';
import '../controllers/role_controller.dart';
import '../widgets/role_card.dart';

class RoleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RoleController>(context, listen: false);
    controller.loadRoles(); // Carrega a lista de roles ao construir a tela

    return Stack(
      children: [
        Consumer<RoleController>(
          builder: (context, controller, child) {
            // Exibe uma mensagem centralizada se a lista de roles estiver vazia
            if (controller.roles.isEmpty) {
              return const Center(child: Text("Nenhuma role cadastrada"));
            }
            // Caso contrário, exibe uma ListView das categorias
            return ListView.builder(
              itemCount: controller.roles.length, // Número de roles na lista
              itemBuilder: (context, index) {
                return RoleCard(
                  role: controller
                      .roles[index], // Exibe cada role usando CategoryCard
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
              // Exibe o pop-up de adicionar role ao pressionar o botão
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddRolePopup(); // Widget responsável por adicionar novas roles
                },
              );
            },
            child: Icon(Icons.add), // Ícone '+' para adicionar roles
            backgroundColor:
                Colors.blue, // Define a cor de fundo do botão como azul
          ),
        ),
      ],
    );
  }
}
