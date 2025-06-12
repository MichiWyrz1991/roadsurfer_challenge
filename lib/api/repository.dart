import 'package:roadsurfer_challenge/api/abstract_api.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';

class CampsiteRepository {
  final CampsiteApi api;

  CampsiteRepository(this.api);

  Future<List<Campsite>> getAll() => api.fetchCampsites();
}
