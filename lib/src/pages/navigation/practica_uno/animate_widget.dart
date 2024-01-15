import 'package:flutter/material.dart';
import 'package:practicas_dos/src/pages/navigation/practica_uno/main_screen.dart';

class Animate extends StatelessWidget {
  const Animate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animate a widget'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: const MainScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
