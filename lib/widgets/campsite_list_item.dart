import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/utils/color.dart';
import 'package:roadsurfer_challenge/utils/price_utils.dart';

class CampsiteListItem extends StatelessWidget {
  final Campsite campsite;
  final VoidCallback? onTap;

  const CampsiteListItem({super.key, required this.campsite, this.onTap});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Card(
      // Todo: put the styling into the theme
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      surfaceTintColor: BrandColors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ListTile(
        // Todo: use cached_network_image
        leading: Image.network(campsite.photo, height: 160, width: 90),
        title: Text(
          campsite.label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        subtitle: Row(
          children: [
            if (campsite.isCloseToWater)
              Tooltip(
                message: loc.campsite_close_to_water,
                child: Icon(
                  Icons.water_outlined,
                  size: 24,
                  color: BrandColors.campingPrimary,
                ),
              ),
            if (campsite.isCampFireAllowed)
              Tooltip(
                message: loc.campsite_fire_allowed,
                child: Icon(
                  Icons.local_fire_department,
                  size: 24,
                  color: BrandColors.campingPrimary,
                ),
              ),
          ],
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (campsite.hostLanguages.contains("de"))
                  Tooltip(
                    message: loc.campsite_languages_tooltip_de,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset("assets/countries/de.png", height: 16),
                    ),
                  ),
                if (campsite.hostLanguages.contains("en"))
                  Tooltip(
                    message: loc.campsite_languages_tooltip_en,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset("assets/countries/en.png", height: 16),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  loc.campsite_price_per_night,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(width: 8),
                Text(
                  PriceUtils.formatPriceFromDouble(
                    context,
                    campsite.pricePerNight,
                  ),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
