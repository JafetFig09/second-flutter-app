import 'package:flutter/material.dart';
import 'package:practicas_dos/src/pages/navigation/practica_cuatro/extract_argument.dart';
import 'package:practicas_dos/src/pages/navigation/practica_cuatro/pass_argument_screen.dart';
import 'package:practicas_dos/src/pages/navigation/practica_cuatro/screen_argument.dart';


// void main() => runApp(const RoutApp());

// class RoutApp extends StatelessWidget {
//   const RoutApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         ExtractArgumentsScreen.routeName: (context) =>
//             const ExtractArgumentsScreen(),
//       },
      
//       onGenerateRoute: (settings) {
 
//         if (settings.name == PassArgumentsScreen.routeName) {

//           final args = settings.arguments as ScreenArguments;

         
//           return MaterialPageRoute(
//             builder: (context) {
//               return PassArgumentsScreen(
//                 title: args.title,
//                 message: args.message,
//               );
//             },
//           );
//         }
       
//         assert(false, 'Need to implement ${settings.name}');
//         return null;
//       },
//       title: 'Navigation with Arguments',
//       home: const HomeScreen(),
//     );
//   }
// }


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pass arguments to named route'),
         backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            ElevatedButton(
              onPressed: () {
            
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'This message is extracted in the build method.',
                  ),
                );
              },
              child: const Text('Navigate to screen that extracts arguments'),
            ),
          
            ElevatedButton(
              onPressed: () {
            
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                    'function.',
                  ),
                );
              },
              child: const Text('Navigate to a named that accepts arguments'),
            ),
          ],
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