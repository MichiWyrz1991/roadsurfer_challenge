import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/abstract_api.dart';
import 'package:roadsurfer_challenge/api/api_impl.dart';
import 'package:roadsurfer_challenge/api/notifier.dart';
import 'package:roadsurfer_challenge/api/repository.dart';
import 'package:roadsurfer_challenge/api/state.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';

final campsiteApiProvider = Provider<CampsiteApi>((ref) {
  return CampsiteApiImpl();
});

final campsiteRepositoryProvider = Provider<CampsiteRepository>((ref) {
  return CampsiteRepository(ref.watch(campsiteApiProvider));
});

final campsitesProvider = FutureProvider<List<Campsite>>((ref) async {
  return ref.watch(campsiteRepositoryProvider).getAll();
});

final campsiteStateProvider =
    StateNotifierProvider<CampsiteStateNotifier, CampsiteState>(
      (ref) => CampsiteStateNotifier(),
    );

final campsiteFilteredProvider = Provider<AsyncValue<List<Campsite>>>((ref) {
  final asyncCampsites = ref.watch(campsitesProvider);
  final filter = ref.watch(campsiteStateProvider);

  return asyncCampsites.whenData((campsites) {
    return campsites.where((campsite) {
      final campfire = !filter.filterCampfire || campsite.isCampFireAllowed;
      final water = !filter.filterWater || campsite.isCloseToWater;
      return campfire && water;
    }).toList();
  });
});
