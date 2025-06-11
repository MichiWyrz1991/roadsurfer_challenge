import 'package:flutter/material.dart';
import 'package:roadsurfer_challenge/model/campsite.dart';
import 'package:roadsurfer_challenge/utils/color.dart';
import 'package:roadsurfer_challenge/utils/price_utils.dart';

class CampsiteListItem extends StatelessWidget {
  final Campsite campsite;
  final VoidCallback? onTap;

  const CampsiteListItem({super.key, required this.campsite, this.onTap});

  @override
  Widget build(BuildContext context) {
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
                message: "Campsite is close to water",
                child: Icon(
                  Icons.water_outlined,
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
                    message: "On this campsite you can speek in German",
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset("countries/de.png", height: 16),
                    ),
                  ),
                if (campsite.hostLanguages.contains("en"))
                  Tooltip(
                    message: "On this campsite you can speek in English",
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset("countries/en.png", height: 16),
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
                  "Preis je Nacht",
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
