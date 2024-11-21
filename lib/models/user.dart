import '../models/role.dart';

class User {
  int id;
  String name;
  int roleId;
  Role role;

  User({
    required this.id,
    required this.name,
    required this.roleId,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      roleId: json['role_id'],
      role: Role.fromJson(json['role']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role_id': roleId,
    };
  }
}
