import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/pages/home/container.dart';
import 'package:roadsurfer_challenge/widgets/bottom_bar.dart';
import 'package:roadsurfer_challenge/widgets/end_drawer.dart';

class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSplitScreen = MediaQuery.of(context).size.width > 800;
    final campsitesAsync = ref.watch(campsiteFilteredProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Roadsurfer Challenge'),
        actions: [Container()],
      ),
      endDrawer: showSplitScreen ? EndDrawer() : null,
      body: campsitesAsync.when(
        data: (campsites) => HomeContainer(campsites: campsites),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
      bottomNavigationBar: showSplitScreen ? null : BottomBar(),
    );
  }
}
