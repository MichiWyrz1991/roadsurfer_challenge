import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/repository/global_provider.dart';

final globalProvider = FutureProvider<List<Campsite>>((ref) {
  return ref.watch(globalRepository).fetchCampsites();
});
