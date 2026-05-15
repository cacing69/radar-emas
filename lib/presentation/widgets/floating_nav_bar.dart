import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radar_emas/presentation/theme/app_colors.dart';

class FloatingNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  static const _icons = [
    LucideIcons.star,
    LucideIcons.newspaper,
    LucideIcons.chartNoAxesCombined,
    LucideIcons.house,
  ];

  const FloatingNavBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: AppShadows.subtle,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_icons.length, (index) {
                final selected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => onChanged(index),
                  child: _NavItem(
                    icon: _icons[index],
                    selected: selected,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const _NavItem({required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircleIndicatorPainter(
        color: AppColors.primary,
        show: selected,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            icon,
            key: ValueKey(selected),
            size: 20,
            color: selected ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class _CircleIndicatorPainter extends CustomPainter {
  final Color color;
  final bool show;

  _CircleIndicatorPainter({required this.color, required this.show});

  @override
  void paint(Canvas canvas, Size size) {
    if (!show) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _CircleIndicatorPainter oldDelegate) {
    return oldDelegate.show != show || oldDelegate.color != color;
  }
}
