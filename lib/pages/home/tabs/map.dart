import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:roadsurfer_challenge/extenstions/campsite.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/utils/color.dart';

class CampsiteMap extends StatelessWidget {
  final List<Campsite> campsites;

  const CampsiteMap({super.key, required this.campsites});

  @override
  Widget build(BuildContext context) {
    var center = LatLng(51.0, 10.0);
    if (campsites.length == 1) {
      center = campsites.first.latLng;
    }

    return FlutterMap(
      options: MapOptions(initialCenter: center, initialZoom: 6),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerLayer(
          markers:
              campsites.map((c) {
                return Marker(
                  width: 40,
                  height: 40,
                  point: c.latLng,
                  child: Icon(
                    Icons.location_on,
                    color: BrandColors.campingPrimary,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
