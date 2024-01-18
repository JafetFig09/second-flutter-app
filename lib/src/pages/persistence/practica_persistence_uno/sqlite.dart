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

  void _insertDog() async {
    var fido = const Dog(
      id: 0,
      name: 'Fido',
      age: 35,
    );
    await insertDog(fido);
    _updateDogList();
  }

  void _updateDog() async {
    var fido = const Dog(
      id: 0,
      name: 'Fido',
      age: 42,
    );
    await updateDog(fido);
    _updateDogList();
  }

  void _deleteDog() async {
    await deleteDog(0);
    _updateDogList();
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
      ),
      body: ListView.builder(
        itemCount: _dogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_dogs[index].name),
            subtitle: Text('Age: ${_dogs[index].age}'),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'hero1',
            onPressed: _insertDog,
            tooltip: 'Insert Dog',
            child:const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'hero2',
            onPressed: _updateDog,
            tooltip: 'Update Dog',
            child: const Icon(Icons.update),
          ),
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