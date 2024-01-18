class Dog {
  final int? id;
  final String name;
  final int age;

  Dog({
    this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    var map = {
      'name': name,
      'age': age,
    };

    if (id != null) {
      map['id'] = id as Object;
    }

    return map;
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}

