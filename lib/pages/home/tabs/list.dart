import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/pages/detail/page.dart';
import 'package:roadsurfer_challenge/widgets/campsite_list_item.dart';

class CampsitesList extends ConsumerWidget {
  final List<Campsite> campsites;

  const CampsitesList({super.key, required this.campsites});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSplitScreen = MediaQuery.of(context).size.width > 800;
    final data = ref.read(campsiteDataProvider.notifier);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: campsites.length,
      itemBuilder: (_, i) {
        return CampsiteListItem(
          campsite: campsites[i],
          onTap: () {
            if (showSplitScreen) {
              data.updateCampsite(campsites[i]);
              Scaffold.of(context).openEndDrawer();
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return DetailsPage(campsite: campsites[i]);
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
