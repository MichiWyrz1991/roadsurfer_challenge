import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/pages/home/container.dart';
import 'package:roadsurfer_challenge/widgets/bottom_bar.dart';
import 'package:roadsurfer_challenge/widgets/end_drawer.dart';

/*
  Todo:
  1. The app should have two views:
    a. The home view shows a list of all the campsites, ordered by name
    b. It’s possible to filter the list by as many of the properties as seems sensible
    c. If a filter is activated, the displayed list is updated accordingly
    d. If a campsite is clicked, a detail view of that campsite is displayed (you decide which properties to show, and how)
  2. (Bonus) Display the campsites on a map and cluster them.
  3. Please write unit tests for your code where appropriate.
 */

class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSplitScreen = MediaQuery.of(context).size.width > 800;
    final campsitesAsync = ref.watch(filteredCampsitesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Roadsurfer Challenge')),
      endDrawer: showSplitScreen ? EndDrawer() : null,
      body: campsitesAsync.when(
        data: (c) => HomeContainer(campsites: c),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
      bottomNavigationBar: showSplitScreen ? null : BottomBar(),
    );
  }
}
