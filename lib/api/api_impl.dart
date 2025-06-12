import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roadsurfer_challenge/api/abstract_api.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';

class CampsiteApiImpl implements CampsiteApi {
  final String _baseUrl = 'https://62ed0389a785760e67622eb2.mockapi.io';
  final String _path = '/spots/v1/campsites';

  @override
  Future<List<Campsite>> fetchCampsites() async {
    final String url = "$_baseUrl$_path";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final List<Campsite> campsites =
          data.map((e) => Campsite.fromJson(e)).toList();
      campsites.sort((a, b) => a.label.compareTo(b.label));
      return campsites;
    } else {
      throw Exception('Failed to load campsites');
    }
  }
}
