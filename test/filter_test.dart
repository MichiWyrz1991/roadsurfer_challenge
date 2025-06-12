import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';

void main() {
  final List<Campsite> data = [
    Campsite(
      id: "1",
      label: "A",
      photo: "photo",
      pricePerNight: 0.0,
      isCloseToWater: true,
      isCampFireAllowed: false,
      hostLanguages: [],
      createdAt: DateTime.now(),
      geoLocation: GeoLocation(latitude: 10.0, longitude: 10.0),
    ),
    Campsite(
      id: "2",
      label: "B",
      photo: "photo",
      pricePerNight: 0.0,
      isCloseToWater: true,
      isCampFireAllowed: true,
      hostLanguages: [],
      createdAt: DateTime.now(),
      geoLocation: GeoLocation(latitude: 10.0, longitude: 10.0),
    ),
  ];

  test('filter by campfire', () async {
    final container = ProviderContainer(
      overrides: [campsitesProvider.overrideWith((_) => data)],
    );

    container.read(campsiteStateProvider.notifier).toggleCampfire();
    final filtered = container.read(campsiteFilteredProvider);
    expect(filtered.value?.length, 1);
    expect(filtered.value?.first.label, 'B');

    container.dispose();
  });

  test('filter by water', () async {
    final container = ProviderContainer(
      overrides: [campsitesProvider.overrideWith((_) => data)],
    );

    container.read(campsiteStateProvider.notifier).toggleWater();
    final filtered = container.read(campsiteFilteredProvider);
    expect(filtered.value?.length, 2);
    expect(filtered.value?[0].label, 'A');
    expect(filtered.value?[1].label, 'B');

    container.dispose();
  });
}
