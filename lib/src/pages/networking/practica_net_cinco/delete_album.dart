import 'package:flutter/material.dart';
import 'package:practicas_dos/src/providers/delete_album_api.dart';
import 'package:practicas_dos/src/providers/fetch_album_api.dart';
import 'package:practicas_dos/utils/album.dart';

class DeleteAlbum extends StatefulWidget {
  const DeleteAlbum({super.key});

  @override
  State<DeleteAlbum> createState() {
    return _DeleteAlbumState();
  }
}

class _DeleteAlbumState extends State<DeleteAlbum> {
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Data on Internet'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
           
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data?.title ?? 'Deleted'),
                    ElevatedButton(
                      child: const Text('Delete Data'),
                      onPressed: () {
                        setState(() {
                          _futureAlbum =
                              deleteAlbum(snapshot.data!.id.toString());
                        });
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
