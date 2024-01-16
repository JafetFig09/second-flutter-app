import 'package:flutter/material.dart';
import 'package:practicas_dos/src/pages/home.dart';
import 'package:practicas_dos/src/pages/navigation/practica_cuatro/extract_argument.dart';
import 'package:practicas_dos/src/pages/navigation/practica_cuatro/home_screen.dart';
import 'package:practicas_dos/src/pages/navigation/practica_dos/navigate_screen.dart';
import 'package:practicas_dos/src/pages/navigation/practica_ocho/todos_screen.dart';
import 'package:practicas_dos/src/pages/navigation/practica_siete/home_siete.dart';
import 'package:practicas_dos/src/pages/navigation/practica_tres/first_screen.dart';
import 'package:practicas_dos/src/pages/navigation/practica_tres/second_screen.dart';
import 'package:practicas_dos/src/pages/navigation/practica_uno/animate_widget.dart';
import 'package:practicas_dos/src/pages/networking/practica_net_cinco/delete_album.dart';
import 'package:practicas_dos/src/pages/networking/practica_net_cuatro/update_api.dart';
import 'package:practicas_dos/src/pages/networking/practica_net_siete/parse_json.dart';
import 'package:practicas_dos/src/pages/networking/practica_net_tres/post_album_api.dart';
import 'package:practicas_dos/src/pages/networking/practica_net_uno/album_api.dart';
import 'package:practicas_dos/utils/todo.dart';

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
    'websokets': (BuildContext context) => const HomePage(),
    'parse_json': (BuildContext context) => const ParseJson(),
    'sqlite': (BuildContext context) => const HomePage(),
    'ride_wride_files': (BuildContext context) => const HomePage(),
    'store_disk': (BuildContext context) => const HomePage(),
    '/second': (BuildContext context) => const SecondScreen(),
    '/extractArguments': (BuildContext constex) => const  ExtractArgumentsScreen()
  };
}
