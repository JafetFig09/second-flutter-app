import 'package:flutter/material.dart';
import 'package:practicas_dos/src/providers/post_album.dart';
import 'package:practicas_dos/utils/album.dart';
class BuildAlbumnApi extends StatefulWidget {
  const BuildAlbumnApi({super.key});

  @override
  State<BuildAlbumnApi> createState() => _BuildAlbumnApiState();
}

class _BuildAlbumnApiState extends State<BuildAlbumnApi> {
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

