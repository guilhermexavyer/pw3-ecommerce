import '../models/role.dart';

class RoleRepository {
  static final List<Role> _roles = [];
  static int _nextId = 1;

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(Duration(milliseconds: 10));
  }

  Future<List<Role>> fetchRoles() async {
    await _simulateNetworkDelay();
    return List.from(_roles);
  }

  Future<Role> createRole(Role role) async {
    await _simulateNetworkDelay();
    role.id = _nextId++;
    _roles.add(role);
    return role;
  }

  Future<void> deleteRole(int id) async {
    await _simulateNetworkDelay();
    _roles.removeWhere((role) => role.id == id);
  }
}
