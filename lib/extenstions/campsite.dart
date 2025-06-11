import 'package:latlong2/latlong.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';

extension CampsiteExtension on Campsite {
  get latLng {
    return LatLng(geoLocation.latitude / 1000, geoLocation.longitude / 1000);
  }
}
