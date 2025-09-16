class Product {
  final int id;
  final String name;

  Product({required this.id, required this.name});

  Product copyWith({int? id, String? name}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name
    );
  }

  @override
  String toString() => 'Product(id: $id, name: $name)';
}