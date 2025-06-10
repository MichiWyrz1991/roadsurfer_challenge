import 'package:flutter/material.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';

class CampsitesList extends StatelessWidget {
  final List<Campsite> campsites;

  const CampsitesList({super.key, required this.campsites});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: campsites.length,
      itemBuilder: (_, i) {
        return ListTile(
          title: Text(
            campsites[i].label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        );
      },
    );
  }
}
