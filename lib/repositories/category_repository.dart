import '../models/category.dart';

class CategoryRepository {
  static final List<Category> _categories = []; // Lista interna de categorias
  static int _nextId = 1; // Variável para acompanhar o próximo ID disponível

  // Simula a latência de uma chamada a um backend
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(
        Duration(milliseconds: 10)); // Simula um atraso de 10 milissegundos
  }

  // Função para buscar todas as categorias
  Future<List<Category>> fetchCategories() async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    return List.from(_categories); // Retorna uma cópia da lista de categorias
  }

  // Função para criar uma nova categoria
  Future<Category> createCategory(Category category) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    category.id = _nextId++; // Atribui o próximo ID e incrementa a variável
    _categories.add(category); // Adiciona a nova categoria à lista
    return category; // Retorna a categoria criada
  }

  // Função para deletar uma categoria
  Future<void> deleteCategory(int id) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _categories.removeWhere(
        (category) => category.id == id); // Remove a categoria da lista
  }
}
