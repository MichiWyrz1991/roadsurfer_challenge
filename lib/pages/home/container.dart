import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/pages/home/tabs/list.dart';
import 'package:roadsurfer_challenge/pages/home/tabs/map.dart';
import 'package:roadsurfer_challenge/widgets/filter.dart';

class HomeContainer extends ConsumerWidget {
  final List<Campsite> campsites;

  const HomeContainer({super.key, required this.campsites});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSplitScreen = MediaQuery.of(context).size.width > 800;
    final state = ref.watch(campsiteStateProvider.notifier);

    final list = CampsitesList(campsites: campsites);
    final map = CampsiteMap(campsites: campsites);
    Widget content = state.getBottomBarIndex() == 0 ? list : map;

    if (showSplitScreen) {
      content = Row(
        children: [
          Expanded(flex: 3, child: list),
          Expanded(flex: 2, child: map),
        ],
      );
    }

    return Column(children: [Filter(), Expanded(child: content)]);
  }
}
