class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

  User copyWith({int? id, String? name}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name
    );
  }

  @override
  String toString() => 'User(id: $id, name: $name)';
}