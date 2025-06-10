import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/repository/provider.dart';

class CampsiteMap extends StatelessWidget {
  final List<Campsite> campsites;

  const CampsiteMap({super.key, required this.campsites});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(center: LatLng(51.0, 10.0), zoom: 6),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        // MarkerLayer(
        //   markers:
        //       campsites.map((c) {
        //         return Marker(
        //           width: 40,
        //           height: 40,
        //           point: LatLng(
        //             c.geoLocation.latitude,
        //             c.geoLocation.longitude,
        //           ),
        //           child: Icon(Icons.location_on, color: Colors.red),
        //         );
        //       }).toList(),
        // ),
      ],
    );
  }
}
