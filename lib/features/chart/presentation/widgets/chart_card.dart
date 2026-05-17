import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:radar_emas/core/theme/app_colors.dart';

class ChartCard extends StatefulWidget {
  final bool isPortrait;
  const ChartCard({super.key, this.isPortrait = true});

  @override
  State<ChartCard> createState() => _ChartCardState();
}

class _ChartCardState extends State<ChartCard> {
  late final List<FlSpot> _beliSpots;
  late final List<FlSpot> _jualSpots;
  double? _touchedBeli;
  double? _touchedJual;

  @override
  void initState() {
    super.initState();
    final random = Random();
    double beli = 27500000.0 + random.nextInt(500000);
    double jual = beli - 2500000 - random.nextInt(2000000);
    _beliSpots = List.generate(7, (i) {
      beli += random.nextInt(500001) - 200000;
      beli = beli.clamp(22500000.0, 28000000.0);
      return FlSpot(i.toDouble(), beli);
    });
    _jualSpots = List.generate(7, (i) {
      jual += random.nextInt(500001) - 200000;
      jual = jual.clamp(22000000.0, 27500000.0);
      return FlSpot(i.toDouble(), jual);
    });
    _touchedBeli = _beliSpots[0].y;
    _touchedJual = _jualSpots[0].y;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: widget.isPortrait
              ? Radius.circular(16)
              : Radius.circular(16),
          topRight: widget.isPortrait
              ? Radius.circular(16)
              : Radius.circular(16),
          bottomRight: widget.isPortrait ? Radius.zero : Radius.circular(16),
          bottomLeft: widget.isPortrait ? Radius.zero : Radius.zero,
        ),
        boxShadow: AppShadows.subtle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          'https://www.logammulia.com/favicon.png?v=3',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Text(
                  'Radar Emas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  '28 Maret 2026',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            if (_touchedBeli != null && _touchedJual != null) ...[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Legend(color: AppColors.accent, label: 'Buyback'),
                          const Gap(4),
                          Text(
                            'IDR ${NumberFormat('#,###', 'id_ID').format(_touchedBeli!)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Legend(color: AppColors.primary, label: 'Sell'),
                          const Gap(4),
                          Text(
                            'IDR ${NumberFormat('#,###', 'id_ID').format(_touchedJual!)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
            Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 200,
                  maxHeight: 200,
                ),
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: const FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 24,
                          getTitlesWidget: _bottomTitles,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (spots) => spots.map((_) => null).toList(),
                      ),
                      touchCallback: (event, response) {
                        final spots = response?.lineBarSpots;
                        if (spots != null && spots.isNotEmpty) {
                          final buyback = spots.firstWhere(
                            (s) => s.barIndex == 0,
                            orElse: () => spots.first,
                          );
                          final jual = spots.firstWhere(
                            (s) => s.barIndex == 1,
                            orElse: () => spots.first,
                          );
                          setState(() {
                            _touchedBeli = buyback.y;
                            _touchedJual = jual.y;
                          });
                        }
                      },
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _beliSpots,
                        isCurved: true,
                        color: AppColors.accent,
                        barWidth: 2.5,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.accent.withValues(alpha: 0.25),
                              AppColors.accent.withValues(alpha: 0.15),
                              AppColors.accent.withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                      LineChartBarData(
                        spots: _jualSpots,
                        isCurved: true,
                        color: AppColors.primary,
                        barWidth: 2.5,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primary.withValues(alpha: 0.15),
                              AppColors.primary.withValues(alpha: 0.05),
                              AppColors.primary.withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                    minY: 22000000,
                    maxY: 28000000,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;

  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Gap(4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

Widget _bottomTitles(double value, TitleMeta meta) {
  const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final index = value.toInt();
  if (index < 0 || index >= labels.length) return const SizedBox();
  return Padding(
    padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
    child: Text(
      labels[index],
      style: const TextStyle(fontSize: 10, color: Colors.grey),
    ),
  );
}
