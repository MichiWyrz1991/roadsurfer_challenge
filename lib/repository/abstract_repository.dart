import 'package:roadsurfer_challenge/model/campsite.dart';

abstract class CampsiteRepository {
  Future<List<Campsite>> fetchCampsites();
}