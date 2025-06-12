import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/pages/detail/page.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(campsiteStateProvider.notifier);

    final campsite = state.getSelectedCampsite();
    if (campsite == null) return Container();
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: DetailsPage(campsite: campsite),
    );
  }
}
