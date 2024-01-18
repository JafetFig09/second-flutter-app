import 'package:flutter/material.dart';
import 'package:practicas_dos/src/pages/persistence/practica_persistence_uno/sqlite.dart';
import 'package:practicas_dos/src/pages/screen.dart';
import 'package:practicas_dos/utils/counter_storage.dart';

List<Todo> myTodos = List<Todo>.generate(
  10, // Número de elementos en la lista
  (i) => Todo(
    'Todo $i', // Título del Todo
    'A description of what needs to be done for Todo $i', // Descripción del Todo
  ),
);

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'animate': (BuildContext context) => const Animate(),
    'navigate': (BuildContext context) => const NavigateWidget(),
    'navigate_routes': (BuildContext context) => const FirstScreen(),
    'arguments_route': (BuildContext context) => const HomeScreen(),
    'switch_access_shortcut': (BuildContext context) => const HomePage(),
    'links_android': (BuildContext context) => const HomePage(),
    'return_screen': (BuildContext context) => const HomePracticaSiete(),
    'send_data': (BuildContext context) => TodosScreen(todos: myTodos),
    'data_internet': (BuildContext context) => const ApiAlbum(),
    // 'request': (BuildContext context) => const HomePage(),
    'send_data_internet': (BuildContext context) => const BuildAlbumApi(),
    'update_data_internet': (BuildContext context) => const UpdateAlbum(),
    'delete_data_internet': (BuildContext context) => const DeleteAlbum(),
    'websokets': (BuildContext context) =>const WebSocketApi(title: 'Websockets'),
    'parse_json': (BuildContext context) => const ParseJson(),
    'sqlite': (BuildContext context) => SqlLitePage(title: 'SQLite', key: UniqueKey()),
    'ride_wride_files': (BuildContext context) => CounterProvider(storage: CounterStorage()),
    'store_disk': (BuildContext context) => const WriteDisk(title: 'Store key-value data on disk'),
    '/second': (BuildContext context) => const SecondScreen(),
    '/extractArguments': (BuildContext constex) =>
        const ExtractArgumentsScreen()
  };
}
