import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/repository/data.dart';

class DataNotifier extends StateNotifier<DataState> {
  DataNotifier() : super(DataState(loading: true, campsites: [])) {
    _loadData();
  }

  void _loadData() {

  }
}
