import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/utils/color.dart';

class Filter extends ConsumerWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    var state = ref.read(campsiteStateProvider.notifier);

    return Container(
      decoration: BoxDecoration(color: BrandColors.white),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              loc.filter_title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          if (state.isCampfireFiltered())
            OutlinedButton(
              onPressed: () => state.toggleCampfire(),
              child: Icon(
                Icons.water_outlined,
                color: BrandColors.campingPrimary,
                size: 24,
              ),
            )
          else
            ElevatedButton(
              onPressed: () => state.toggleCampfire(),
              child: Icon(
                Icons.water_outlined,
                color: BrandColors.white,
                size: 24,
              ),
            ),
          const SizedBox(width: 16),
          if (state.isWaterFiltered())
            OutlinedButton(
              onPressed: () => state.toggleWater(),
              child: Icon(
                Icons.local_fire_department,
                color: BrandColors.campingPrimary,
                size: 24,
              ),
            )
          else
            ElevatedButton(
              onPressed: () => state.toggleWater(),
              child: Icon(
                Icons.local_fire_department,
                color: BrandColors.white,
                size: 24,
              ),
            ),
        ],
      ),
    );
  }
}
