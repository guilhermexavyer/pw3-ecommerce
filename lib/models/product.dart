import 'subcategory.dart';

class Product {
  int id;
  String name;
  double price;
  int subCategoryId;
  Subcategory subCategory;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.subCategoryId,
    required this.subCategory,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      subCategoryId: json['sub_category_id'],
      subCategory: Subcategory.fromJson(json['sub_category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'sub_category_id': subCategoryId,
      'sub_category': subCategory.toJson(),
    };
  }
}
