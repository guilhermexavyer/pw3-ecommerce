import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_user_popup.dart';
import '../controllers/user_controller.dart';
import '../widgets/user_card.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context, listen: false);
    controller.loadUsers(); // Carrega a lista de usuários ao construir a tela

    return Stack(
      children: [
        Consumer<UserController>(
          builder: (context, controller, child) {
            // Exibe uma mensagem centralizada se a lista de usuários estiver vazia
            if (controller.users.isEmpty) {
              return const Center(child: Text("Nenhum usuário cadastrado"));
            }
            // Caso contrário, exibe uma ListView dos usuários
            return ListView.builder(
              itemCount: controller.users.length, // Número de usuários na lista
              itemBuilder: (context, index) {
                return UserCard(
                  user: controller
                      .users[index], // Exibe cada usuário usando UserCard
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
              // Exibe o pop-up de adicionar usuário ao pressionar o botão
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddUserPopup(); // Widget responsável por adicionar novos usuários
                },
              );
            },
            child: Icon(Icons.add), // Ícone '+' para adicionar usuários
            backgroundColor:
                Colors.blue, // Define a cor de fundo do botão como azul
          ),
        ),
      ],
    );
  }
}
