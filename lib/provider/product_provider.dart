import 'package:flutter/foundation.dart';
import 'package:learn_testing/model/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  @visibleForTesting
  void setProducts(List<Product> products) {
    _products = products;
  }

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));

    _products = [
      Product(id: 1, name: "Ayam"),
      Product(id: 2, name: "Ikan"),
      Product(id: 3, name: "Laptop"),
    ];
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addProduct(String name) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));
    final newProduct = Product(
      id: DateTime.now().microsecondsSinceEpoch,
      name: name,
    );

    _products.add(newProduct);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> editProduct(int id, String newName) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));
    _products = _products
        .map((p) => p.id == id ? p.copyWith(name: newName) : p)
        .toList();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteProduct(int id) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));
    _products = _products.where((p) => p.id != id).toList();
    _isLoading = false;
    notifyListeners();
  }

  Product? findByName(String name) {
    try {
      return _products.firstWhere(
        (p) => p.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
