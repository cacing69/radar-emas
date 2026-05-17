import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radar_emas/core/theme/app_colors.dart';
import 'package:radar_emas/core/widgets/nav_item.dart';
import 'package:radar_emas/core/widgets/radar_emas_app_bar.dart';

class RadarEmasNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  static const _icons = [
    LucideIcons.star,
    LucideIcons.newspaper,
    LucideIcons.chartNoAxesCombined,
    LucideIcons.house,
  ];

  const RadarEmasNavBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final navItems = List.generate(_icons.length, (index) {
      final selected = selectedIndex == index;
      return GestureDetector(
        onTap: () => onChanged(index),
        child: NavItem(icon: _icons[index], selected: selected),
      );
    });

    return SafeArea(
      child: Align(
        alignment: isPortrait ? Alignment.bottomCenter : Alignment.topCenter,
        child: Column(
          children: [
            isPortrait
                ? SizedBox.shrink()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 48,
                          width: 48,
                          child: RadarEmasAvatarMenu(avatarKey: GlobalKey()),
                        ),
                      ),
                      Gap(10),
                    ],
                  ),
            Padding(
              padding: isPortrait
                  ? const EdgeInsets.only(bottom: 10)
                  : const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: AppShadows.subtle,
                ),
                padding: isPortrait
                    ? const EdgeInsets.all(8)
                    : const EdgeInsets.all(6),
                child: isPortrait
                    ? Row(mainAxisSize: MainAxisSize.min, children: navItems)
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: navItems,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
