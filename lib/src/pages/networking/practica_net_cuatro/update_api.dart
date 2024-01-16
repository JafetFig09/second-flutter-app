import 'package:flutter/material.dart';
import 'package:practicas_dos/src/providers/fetch_album_api.dart';
import 'package:practicas_dos/src/providers/update_album_api.dart';
import 'package:practicas_dos/utils/album.dart';

class UpdateAlbum extends StatefulWidget {
  const UpdateAlbum({super.key});

  @override
  State<UpdateAlbum> createState() => _UpdateAlbumState();
}

class _UpdateAlbumState extends State<UpdateAlbum> {
  final TextEditingController _controller = TextEditingController();
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
        title: const Text('Update Album'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data!.title),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter Title',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureAlbum = updateAlbum(_controller.text);
                        });
                      },
                      child: const Text('Update Data'),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
