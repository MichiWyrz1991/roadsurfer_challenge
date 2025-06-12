import 'package:roadsurfer_challenge/model/campsite.dart';

class CampsiteState {
  bool filterCampfire;
  bool filterWater;
  int bottomBarIndex;
  Campsite? selectedCampsite;

  CampsiteState({
    this.filterCampfire = false,
    this.filterWater = false,
    this.bottomBarIndex = 0,
    this.selectedCampsite,
  });

  CampsiteState copyWith({
    bool? filterCampfire,
    bool? filterWater,
    int? bottomBarIndex,
    Campsite? selected,
  }) {
    return CampsiteState(
      filterCampfire: filterCampfire ?? this.filterCampfire,
      filterWater: filterWater ?? this.filterWater,
      bottomBarIndex: bottomBarIndex ?? this.bottomBarIndex,
      selectedCampsite: selected,
    );
  }
}
