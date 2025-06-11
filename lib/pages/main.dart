import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/pages/home/tabs/list.dart';
import 'package:roadsurfer_challenge/pages/home/tabs/map.dart';
import 'package:roadsurfer_challenge/repository/async_provider.dart';

class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsitesAsync = ref.watch(globalProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Roadsurfer Coding Challenge')),
      body: campsitesAsync.when(
        data: (campsites) {
          if (kIsWeb) {
            return Row(
              children: [
                Expanded(flex: 3, child: CampsitesList(campsites: campsites)),
                Expanded(flex: 2, child: CampsiteMap(campsites: campsites)),
              ],
            );
          } else {
            return CampsitesList(campsites: campsites);
          }
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
