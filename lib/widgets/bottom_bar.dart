import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurfer_challenge/api/provider.dart';
import 'package:roadsurfer_challenge/utils/color.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final data = ref.read(campsiteDataProvider.notifier);

    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: BrandColors.campingPrimary,
      unselectedItemColor: BrandColors.secondaryText,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: loc.bottom_bar_campsites,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: loc.bottom_bar_map,
        ),
      ],
      currentIndex: data.getBottomBarIndex(),
      onTap: (i) => data.updateBottomBarIndex(i),
    );
  }
}
