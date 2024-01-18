import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practicas_dos/utils/counter_storage.dart';


class CounterProvider extends StatefulWidget {
  const CounterProvider({super.key, required this.storage});

  final CounterStorage storage;

  @override
  State<CounterProvider> createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<CounterProvider> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}