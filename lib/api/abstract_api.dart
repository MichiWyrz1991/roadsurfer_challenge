import 'package:roadsurfer_challenge/model/campsite.dart';

abstract class CampsiteApi {
  Future<List<Campsite>> fetchCampsites();
}
