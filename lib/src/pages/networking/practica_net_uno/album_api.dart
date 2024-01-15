import 'package:flutter/material.dart';
import 'package:practicas_dos/utils/album.dart';
import 'package:practicas_dos/src/providers/fetch_album_api.dart';

class ApiAlbum extends StatefulWidget {
  const ApiAlbum({super.key});

  @override
  State<ApiAlbum> createState() => _ApiAlbumState();
}

class _ApiAlbumState extends State<ApiAlbum> {
  late Future<Album> futureAlbum;

  static const style =  TextStyle(color: Colors.white, fontSize: 20);
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fecth Api'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                     mainAxisSize: MainAxisSize.min,
                      children: [
                       Text('User Id: ${snapshot.data!.userId}', style: style),
                        Text('Id: ${snapshot.data!.id}', style: style,),
                        Text(
                        'Title: ${snapshot.data!.title}',
                        style: style
                       )
                    ],
                  ),
                ),
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
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
