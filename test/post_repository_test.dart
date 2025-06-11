import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/repository/abstract_repository.dart';
import 'package:roadsurfer_challenge/repository/async_provider.dart';
import 'package:roadsurfer_challenge/repository/global_provider.dart';

import 'post_repository_test.mocks.dart';

@GenerateMocks([CampsiteRepository])
void main() {
  test('Provider loads mock data', () async {
    final mockRepo = MockCampsiteRepository();

    when(mockRepo.fetchCampsites()).thenAnswer(
      (_) async => [
        Campsite(
          id: "1",
          label: "Foo Bar",
          photo: "photo",
          pricePerNight: 100.00,
          isCloseToWater: true,
          isCampFireAllowed: true,
          hostLanguages: [],
          createdAt: DateTime.now(),
          geoLocation: GeoLocation(latitude: 10.0, longitude: 10.0),
        ),
      ],
    );

    final container = ProviderContainer(
      overrides: [globalRepository.overrideWithValue(mockRepo)],
    );

    addTearDown(container.dispose);

    final result = await container.read(globalProvider.future);

    expect(result.length, 1);
    expect(result.first.label, "Foo Bar");
  });
}
