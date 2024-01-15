import 'package:flutter/material.dart';
import 'package:practicas_dos/routes/routes.dart';
import 'package:practicas_dos/src/pages/navigation/practica_cuatro/pass_argument_screen.dart';
import 'package:practicas_dos/src/pages/navigation/practica_cuatro/screen_argument.dart';
// import 'package:practicas_dos/src/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      title: 'Practicas Dos',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
    
       onGenerateRoute: (settings) {
 
        if (settings.name == PassArgumentsScreen.routeName) {

          final args = settings.arguments as ScreenArguments;

         
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
       
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
