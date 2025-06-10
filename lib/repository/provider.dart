import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/repository/data.dart';
import 'package:roadsurfer_challenge/repository/notifier.dart';

final campsitesProvider = StateNotifierProvider<DataNotifier, DataState>((_) {
  return DataNotifier();
});
