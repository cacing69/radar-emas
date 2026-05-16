import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radar_emas/core/theme/app_colors.dart';
import 'package:radar_emas/core/widgets/nav_item.dart';

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
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: AppShadows.subtle,
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_icons.length, (index) {
                final selected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => onChanged(index),
                  child: NavItem(icon: _icons[index], selected: selected),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
