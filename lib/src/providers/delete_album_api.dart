import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:practicas_dos/utils/album.dart';

Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    
    throw Exception('Failed to delete album.');
  }
}