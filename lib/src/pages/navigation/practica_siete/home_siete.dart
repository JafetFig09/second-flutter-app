import 'package:flutter/material.dart';
import 'package:practicas_dos/src/pages/navigation/practica_siete/selection_button.dart';

class HomePracticaSiete extends StatelessWidget {
  const HomePracticaSiete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send data to new screen'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

       body: const Center(
        child: SelectionButton(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}