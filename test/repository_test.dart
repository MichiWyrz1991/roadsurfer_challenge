import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/api/repository.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';

import 'repository_test.mocks.dart';

@GenerateMocks([CampsiteRepository])
void main() {
  final List<Campsite> data = [
    Campsite(
      id: "1",
      label: "Sunny Lake",
      photo: "photo",
      pricePerNight: 99.00,
      isCloseToWater: true,
      isCampFireAllowed: true,
      hostLanguages: ["de"],
      createdAt: DateTime.now(),
      geoLocation: GeoLocation(latitude: 10.0, longitude: 10.0),
    ),
    Campsite(
      id: "2",
      label: "Beautiful mountains",
      photo: "photo",
      pricePerNight: 123.45,
      isCloseToWater: true,
      isCampFireAllowed: true,
      hostLanguages: ["de", "en"],
      createdAt: DateTime.now(),
      geoLocation: GeoLocation(latitude: 10.0, longitude: 10.0),
    ),
  ];

  test('Provider loads single data', () async {
    final mockRepo = MockCampsiteRepository();

    when(mockRepo.getAll()).thenAnswer((_) async => [data.first]);

    final container = ProviderContainer(
      overrides: [campsiteRepositoryProvider.overrideWithValue(mockRepo)],
    );

    addTearDown(container.dispose);

    final result = await container.read(campsitesProvider.future);

    expect(result.length, 1);
    expect(result.first.label, "Sunny Lake");
  });

  test('Provider loads multiple data', () async {
    final mockRepo = MockCampsiteRepository();

    when(mockRepo.getAll()).thenAnswer((_) async => data);

    final container = ProviderContainer(
      overrides: [campsiteRepositoryProvider.overrideWithValue(mockRepo)],
    );

    addTearDown(container.dispose);

    final result = await container.read(campsitesProvider.future);

    expect(result.length, 2);
    expect(result.first.label, "Sunny Lake");
    expect(result[1].label, "Beautiful mountains");
  });
}
