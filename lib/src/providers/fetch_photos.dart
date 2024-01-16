import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:practicas_dos/utils/parse_photos.dart';
import 'package:practicas_dos/utils/photo.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}