import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/repository/abstract_repository.dart';

class ApiCampsiteRepository implements CampsiteRepository {
  final String _baseUrl = 'https://62ed0389a785760e67622eb2.mockapi.io';
  final String _path = '/spots/v1/campsites';

  @override
  Future<List<Campsite>> fetchCampsites() async {
    final String url = "$_baseUrl$_path";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Campsite.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load campsites');
    }
  }
}
