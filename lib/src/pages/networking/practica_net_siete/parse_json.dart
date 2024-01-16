import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practicas_dos/src/providers/fetch_photos.dart';
import 'package:practicas_dos/utils/photo.dart';
import 'package:practicas_dos/utils/photo_list.dart';

class ParseJson extends StatelessWidget {
  const ParseJson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Parse Json'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:  FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
