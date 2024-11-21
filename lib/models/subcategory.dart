import '../models/category.dart';

class Subcategory {
  int id;
  String name;
  int categoryId;
  Category category;

  Subcategory({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
      category: Category.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_id': categoryId,
    };
  }
}
