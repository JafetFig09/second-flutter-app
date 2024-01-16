import 'package:flutter/material.dart';
import 'package:practicas_dos/src/providers/menu.dart';
import 'package:practicas_dos/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Practica Dos'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: _list()
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _buildListItems(snapshot.data!, context),
          );
        } else {
          return const CircularProgressIndicator(
            backgroundColor: Colors.red,
          ); 
        }
      },
    );
  }

  List<Widget> _buildListItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    for (var opt in data) {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: getIcon(opt['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      options
        ..add(widgetTemp)
        ..add(const Divider());
    }

    
    return options;
  }
}
