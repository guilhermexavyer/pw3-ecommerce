import 'package:ecommerce_front/utils/app_storage.dart';

class LoginRepository {
  // Lista fixa de usuários para simulação de autenticação
  final List<Map<String, String>> _users = [
    {"username": "xavier", "password": "Topeira.01"},
    {"username": "user", "password": "password"},
  ];

  Future<bool> login(String username, String password) async {
    // Simula um delay para imitar uma requisição real
    await Future.delayed(Duration(seconds: 1));

    // Verifica se as credenciais são válidas
    for (var user in _users) {
      if (user["username"] == username && user["password"] == password) {
        AppStorage.instance.setToken(
            "asdad12312sfaskjdlk1j29803.asd.asdh102387asdhjlhalsjkdlkasdjlaj");
        return true; // Credenciais corretas
      }
    }
    return false; // Credenciais inválidas
  }
}