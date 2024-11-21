import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/category_controller.dart';
import 'controllers/login_controller.dart';
import 'controllers/product_controller.dart';
import 'controllers/role_controller.dart';
import 'controllers/subcategory_controller.dart';
import 'controllers/user_controller.dart';
import 'screens/login_screen.dart';

void main() {
  // Inicia o app com MultiProvider para gerenciar múltiplos controladores de estado
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                ProductController()), // Inicia o ProductController como provedor de estado
        ChangeNotifierProvider(
            create: (_) =>
                CategoryController()), // Inicia o CategoryController como provedor de estado
        ChangeNotifierProvider(
            create: (_) =>
                SubcategoryController()), // Inicia o SubcategoryController como provedor de estado
        ChangeNotifierProvider(
            create: (_) =>
                RoleController()), // Inicia o RoleController como provedor de estado
        ChangeNotifierProvider(
            create: (_) =>
                UserController()), // Inicia o UserController como provedor de estado
        ChangeNotifierProvider(
            create: (_) =>
                LoginController()), // Inicia o UserController como provedor de estado
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor padrão do tema
      ),
      home: LoginScreen(),
    );
  }
}
