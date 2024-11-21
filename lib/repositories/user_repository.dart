import '../models/user.dart';

class UserRepository {
  final List<User> _users = [];
  int _nextId = 1;

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(Duration(milliseconds: 10));
  }

  Future<List<User>> fetchUsers() async {
    return List.from(_users);
  }

  Future<User> createUser(User user) async {
    await _simulateNetworkDelay();
    user.id = _nextId++;
    _users.add(user);

    return User(
      id: user.id,
      name: user.name,
      roleId: user.roleId,
      role: user.role,
    );
  }

  Future<void> deleteUser(int id) async {
    await _simulateNetworkDelay();
    _users.removeWhere((users) => users.id == id);
  }
}
