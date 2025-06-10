import 'package:roadsurfer_challenge/model/campsite.dart';

class DataState {
  final bool loading;
  final List<Campsite> campsites;

  DataState({required this.loading, required this.campsites});

  DataState copyWith({bool? loading, List<Campsite>? campsites}) {
    return DataState(
      loading: loading ?? this.loading,
      campsites: campsites ?? this.campsites,
    );
  }
}
