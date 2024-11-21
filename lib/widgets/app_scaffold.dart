import 'package:flutter/material.dart';
import '../screens/category_list_screen.dart';
import '../screens/login_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/role_list_screen.dart';
import '../screens/subcategory_list_screen.dart';
import '../screens/user_list_screen.dart';

// Classe AppScaffold, que define a estrutura básica do aplicativo
class AppScaffold extends StatelessWidget {
  // Define o conteúdo principal da tela que será exibido no corpo
  final Widget bodyContent;

  // Construtor da classe AppScaffold que recebe o conteúdo principal como parâmetro
  AppScaffold({required this.bodyContent});

  @override
  Widget build(BuildContext context) {
    // Retorna a estrutura Scaffold, que é a base da tela
    return Scaffold(
      // Configuração da AppBar na parte superior da tela
      appBar: AppBar(
        title: Text("Product App"), // Define o título do app bar
        actions: [
          // Exibe o avatar do usuário e um menu suspenso (PopupMenuButton) no app bar
          Row(
            children: [
              // CircleAvatar para mostrar a imagem do usuário
              CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/images/user_avatar.png"), // Imagem do usuário no avatar
              ),
              SizedBox(width: 8), // Espaçamento entre o avatar e o menu
              // PopupMenuButton que exibe um menu ao clicar
              PopupMenuButton<String>(
                // Função chamada quando uma opção é selecionada
                onSelected: (value) {
                  if (value == 'logout') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
                // Define os itens do menu suspenso
                itemBuilder: (BuildContext context) {
                  return [
                    // Item do menu para Logout
                    PopupMenuItem<String>(
                      value: 'logout', // Valor associado à opção
                      child: Text('Logout'), // Texto exibido para o item
                    ),
                  ];
                },
                // Texto exibido no botão do menu suspenso
                child: Text("Nome do Usuário"), // Nome do usuário na AppBar
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Produtos'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppScaffold(bodyContent: ProductListScreen()),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Categorias'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppScaffold(bodyContent: CategoryListScreen()),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Subategorias'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppScaffold(bodyContent: SubcategoryListScreen()),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Role'),
              onTap: () {
                // Navega para a tela de lista de categorias ao selecionar o item
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppScaffold(bodyContent: RoleListScreen()),
                  ),
                );
              },
            ),
            // Outros itens do menu podem ser adicionados aqui
            ListTile(
              title: Text('User'), // Título do item "Categorias"
              onTap: () {
                // Navega para a tela de lista de categorias ao selecionar o item
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppScaffold(bodyContent: UserListScreen()),
                  ),
                );
              },
            ),
            // Outros itens do menu podem ser adicionados aqui
          ],
        ),
      ),
      // Define o conteúdo principal da tela
      body: bodyContent,
    );
  }
}
