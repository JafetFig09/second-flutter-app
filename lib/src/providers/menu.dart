// ignore_for_file: avoid_print
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  
  _MenuProvider();

  Future<List<dynamic>> loadData() async {
    try {
      final response = await rootBundle.loadString('data/menu.json');
      Map dataMap = json.decode(response);
      options = dataMap['rutas'];
    } catch (e) {
      print('Error: $e');
    }
    return options;
  }
}

final menuProvider = _MenuProvider();
