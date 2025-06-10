import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/repository/abstract_repository.dart';
import 'package:roadsurfer_challenge/repository/api_repository.dart';

final globalRepository = Provider<CampsiteRepository>((ref) {
  return ApiCampsiteRepository();
});
