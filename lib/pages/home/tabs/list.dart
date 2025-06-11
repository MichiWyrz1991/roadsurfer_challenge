import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/utils/color.dart';
import 'package:roadsurfer_challenge/widgets/campsite_list_item.dart';

class CampsitesList extends StatelessWidget {
  final List<Campsite> campsites;

  const CampsitesList({super.key, required this.campsites});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: campsites.length,
      itemBuilder: (_, i) {
        return CampsiteListItem(
          campsite: campsites[i],
          onTap: !kIsWeb ? null : () => _onTap(),
        );
      },
    );
  }

  void _onTap() {
    print("show details");
  }
}
