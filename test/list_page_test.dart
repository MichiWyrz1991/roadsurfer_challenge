import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_image_test_utils/flutter_image_test_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/pages/home/tabs/list.dart';

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

  testWidgets('Display items', (tester) async {
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: CampsitesList(campsites: data),
          ),
        ),
      );
    });

    expect(find.text('Sunny Lake'), findsOneWidget);
  });
}
