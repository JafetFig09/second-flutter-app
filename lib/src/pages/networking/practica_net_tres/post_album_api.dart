import 'package:flutter/material.dart';
import 'package:practicas_dos/src/providers/post_album.dart';
import 'package:practicas_dos/utils/album.dart';


class BuildAlbumApi extends StatefulWidget {
  const BuildAlbumApi({super.key});

  @override
  State<BuildAlbumApi> createState() => _BuildAlbumApiState();
}

class _BuildAlbumApiState extends State<BuildAlbumApi> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Data to the internet'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }



  Column buildColumn() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Enter Title'),
      ),
      ElevatedButton(
        onPressed: (){
          setState(() {
            _futureAlbum = createAlbum(_controller.text);
          });
        }, 
        child: const Text('Create Data'),
      )
      ],
    );
  }

    FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

