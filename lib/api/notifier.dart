import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/data.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';

class CampsiteNotifier extends StateNotifier<CampsiteData> {
  CampsiteNotifier() : super(CampsiteData());

  bool withFilterCampfire() {
    return state.filterCampfire;
  }

  bool withFilterWater() {
    return state.filterWater;
  }

  void toggleCampfire() {
    state = state.copyWith(filterCampfire: !state.filterCampfire);
  }

  void toggleWater() {
    state = state.copyWith(filterWater: !state.filterWater);
  }

  Campsite? getSelectedCampsite() {
    return state.selectedCampsite;
  }

  void updateCampsite(Campsite campsite) {
    state = state.copyWith(selected: campsite);
  }

  int getBottomBarIndex() {
    return state.bottomBarIndex;
  }

  void updateBottomBarIndex(int index) {
    state = state.copyWith(bottomBarIndex: index);
  }
}
