import 'package:flutter/material.dart';
import 'package:radar_emas/core/theme/app_colors.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const NavItem({super.key, required this.icon, required this.selected});

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
