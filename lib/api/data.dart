import 'package:roadsurfer_challenge/model/campsite.dart';

class CampsiteData {
  bool filterCampfire;
  bool filterWater;
  int bottomBarIndex;
  Campsite? selectedCampsite;

  CampsiteData({
    this.filterCampfire = false,
    this.filterWater = false,
    this.bottomBarIndex = 0,
    this.selectedCampsite,
  });

  CampsiteData copyWith({
    bool? filterCampfire,
    bool? filterWater,
    int? bottomBarIndex,
    Campsite? selected,
  }) {
    return CampsiteData(
      filterCampfire: filterCampfire ?? this.filterCampfire,
      filterWater: filterWater ?? this.filterWater,
      bottomBarIndex: bottomBarIndex ?? this.bottomBarIndex,
      selectedCampsite: selected,
    );
  }
}
