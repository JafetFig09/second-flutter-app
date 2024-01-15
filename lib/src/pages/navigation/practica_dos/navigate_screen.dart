import 'package:flutter/material.dart';
import 'package:practicas_dos/src/pages/navigation/practica_dos/second_route.dart';

class NavigateWidget extends StatelessWidget {
  const NavigateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigate to new Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondRoute()));
          },
        ),
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
