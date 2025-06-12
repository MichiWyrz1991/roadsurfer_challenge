import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/pages/home/tabs/map.dart';
import 'package:roadsurfer_challenge/utils/color.dart';
import 'package:roadsurfer_challenge/utils/price_utils.dart';

class DetailsPage extends StatelessWidget {
  final Campsite campsite;

  const DetailsPage({super.key, required this.campsite});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.campsite_page_title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(campsite.photo, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Text(campsite.label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 16),
          if (campsite.isCloseToWater)
            Row(
              children: [
                Icon(
                  Icons.water_outlined,
                  size: 24,
                  color: BrandColors.campingPrimary,
                ),
                const SizedBox(width: 16),
                Text(
                  loc.campsite_close_to_water,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          if (campsite.isCampFireAllowed)
            Row(
              children: [
                Icon(
                  Icons.local_fire_department,
                  size: 24,
                  color: BrandColors.campingPrimary,
                ),
                const SizedBox(width: 16),
                Text(
                  loc.campsite_fire_allowed,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          const SizedBox(height: 16),
          Text(
            loc.campsite_languages_title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            children: [
              if (campsite.hostLanguages.contains("de"))
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.asset("assets/countries/de.png", height: 16),
                ),
              if (campsite.hostLanguages.contains("en"))
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.asset("assets/countries/en.png", height: 16),
                ),
            ],
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(2),
              surfaceTintColor: BrandColors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: CampsiteMap(campsites: [campsite]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: BrandColors.white),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  loc.campsite_price_per_night,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  PriceUtils.formatPriceFromDouble(
                    context,
                    campsite.pricePerNight,
                  ),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  loc.campsite_cta_book_now,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
