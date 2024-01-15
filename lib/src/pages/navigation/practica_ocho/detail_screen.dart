import 'package:flutter/material.dart';
import 'package:practicas_dos/utils/todo.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({super.key, required this.todo});

  
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(todo.description),
      ),
    );
  }
}