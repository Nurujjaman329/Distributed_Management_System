import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DataModel with ChangeNotifier {
  int _metric1 = 0;
  int _metric2 = 0;

  int get metric1 => _metric1;
  int get metric2 => _metric2;

  Future<void> fetchMetrics() async {
    final response =
        await http.get(Uri.parse('https://api.example.com/metrics'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _metric1 = data['metric1'];
      _metric2 = data['metric2'];
      notifyListeners();
    } else {
      throw Exception('Failed to load metrics');
    }
  }
}
