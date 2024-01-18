// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:practicas_dos/src/providers/provider_dog.dart';
import 'package:practicas_dos/utils/dog.dart';

class SqlLitePage extends StatefulWidget {
  const SqlLitePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _SqlLitePageState createState() => _SqlLitePageState();
}

class _SqlLitePageState extends State<SqlLitePage> {
  List<Dog> _dogs = [];



  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _idController.dispose();
    super.dispose();
  }

  void _insertDog() async {
     if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Llene todos los campos')),
        );
        return;
      }

      int? age = int.tryParse(_ageController.text);
      if (age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('solo numeros')),
      );
        return;
    }

     int? id = int.tryParse(_idController.text);
      if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('solo numeros')),
      );
        return;
    }
   
    var fido = Dog(
      name: _nameController.text,
      age: int.parse(_ageController.text),
    );
    await insertDog(fido);
    _updateDogList();

    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _updateDog() async {
     if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Llena todos los campos')),
        );
        return;
      }

      int? age = int.tryParse(_ageController.text);
      if (age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('solo numeros')),
      );
        return;
    }

     int? id = int.tryParse(_idController.text);
      if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('solo numeros')),
      );
        return;
    }
    var dog = await getById(int.parse(_idController.text));
    var fido = Dog(
      id: dog.id,
      name: _nameController.text,
      age: int.parse(_ageController.text),
    );
    await updateDog(fido);
    _updateDogList();
    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _deleteDog() async {
    
     int? id = int.tryParse(_idController.text);
      if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('solo numeros')),
      );
        return;
    }
    await deleteDog(int.parse(_idController.text));
    _updateDogList();
    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _updateDogList() async {
    _dogs = await dogs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text('Nombre del perro:'),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Edad del perro:'),
                    TextFormField(
                      controller: _ageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Id del perro:'),
                    TextFormField(
                      controller: _idController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Text('List of Dogs'),
            Expanded(
              child: FutureBuilder<List<Dog>>(
                future: dogs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    _dogs = snapshot.data!;
                    return ListView.builder(
                      itemCount: _dogs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              'ID: ${_dogs[index].id}, Name: ${_dogs[index].name}'),
                          subtitle: Text('Age: ${_dogs[index].age}'),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'hero1',
            onPressed: _insertDog,
            tooltip: 'Insert Dog',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'hero2',
            onPressed: _updateDog,
            tooltip: 'Update Dog',
            child: const Icon(Icons.update),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'hero3',
            onPressed: _deleteDog,
            tooltip: 'Delete Dog',
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
