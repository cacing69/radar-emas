import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:radar_emas/core/theme/app_colors.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/presentation/providers/chart_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChartCard extends ConsumerStatefulWidget {
  final bool isPortrait;

  const ChartCard({
    super.key,
    this.isPortrait = true,
  });

  @override
  ConsumerState<ChartCard> createState() => _ChartCardState();
}

class _ChartCardState extends ConsumerState<ChartCard> {
  double? _touchedBeli;
  double? _touchedJual;
  String? _touchedDate;

  @override
  Widget build(BuildContext context) {
    final selectedPrice = ref.watch(selectedChartPriceProvider);
    final historyAsync = selectedPrice != null
        ? ref.watch(priceHistoryProvider(selectedPrice))
        : null;

    final isLoading = selectedPrice == null ||
        historyAsync == null ||
        historyAsync.isLoading;

    ref.listen(selectedChartPriceProvider, (prev, next) {
      if (prev != next) {
        _touchedBeli = null;
        _touchedJual = null;
        _touchedDate = null;
      }
    });

    final prices = historyAsync?.asData?.value ?? [];
    final buyback = _touchedBeli ?? selectedPrice?.buybackPrice ?? 0;
    final sell = _touchedJual ?? selectedPrice?.sellPrice ?? 0;
    final dateText = _touchedDate ??
        (!isLoading && prices.isNotEmpty
            ? _formatDate(_groupByDate(prices).keys.last)
            : '');

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
      child: Skeletonizer(
        enabled: isLoading,
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
                  Expanded(
                    child: Text(
                      selectedPrice?.materialType ?? 'Radar Emas',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Text(
                    dateText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
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
                            'IDR ${NumberFormat('#,###', 'id_ID').format(buyback)}',
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
                            'IDR ${NumberFormat('#,###', 'id_ID').format(sell)}',
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
              Gap(5),
              Expanded(
                child: historyAsync?.when(
                      loading: () => _buildChartSkeleton(),
                      error: (error, _) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Failed to load chart',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const Gap(8),
                            IconButton(
                              icon: const Icon(Icons.refresh, size: 20),
                              onPressed: () => ref.invalidate(
                                priceHistoryProvider(selectedPrice!),
                              ),
                            ),
                          ],
                        ),
                      ),
                      data: (prices) {
                        if (prices.isEmpty) {
                          return const Center(
                            child: Text(
                              'No data available',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          );
                        }
                        return _buildChart(prices);
                      },
                    ) ??
                    _buildChartSkeleton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChartSkeleton() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Skeletonizer(
        enabled: true,
        child: Bone(
          width: double.infinity,
          height: 140,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildChart(List<GoldPrice> prices) {
    final grouped = _groupByDate(prices);
    final dates = grouped.keys.toList();

    final beliSpots = <FlSpot>[];
    final jualSpots = <FlSpot>[];

    for (var i = 0; i < dates.length; i++) {
      final entry = grouped[dates[i]]!;
      beliSpots.add(FlSpot(i.toDouble(), entry.buybackPrice));
      jualSpots.add(FlSpot(i.toDouble(), entry.sellPrice));
    }

    final allY = [...beliSpots, ...jualSpots].map((s) => s.y).toList();
    final rawMin = allY.reduce((a, b) => a < b ? a : b);
    final rawMax = allY.reduce((a, b) => a > b ? a : b);
    final padding = (rawMax - rawMin) * 0.1;

    final dateLabels = dates.map((d) => _formatShortDate(d)).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 24,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= dateLabels.length) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
                    child: Text(
                      dateLabels[index],
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  );
                },
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
                  final dateIndex = buyback.x.toInt();
                  if (dateIndex >= 0 && dateIndex < dates.length) {
                    _touchedDate = _formatDate(dates[dateIndex]);
                  }
                });
              }
            },
          ),
          lineBarsData: [
            LineChartBarData(
              spots: beliSpots,
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
              spots: jualSpots,
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
          minY: (rawMin - padding).floorToDouble(),
          maxY: (rawMax + padding).ceilToDouble(),
        ),
      ),
    );
  }

  Map<String, GoldPrice> _groupByDate(List<GoldPrice> prices) {
    final map = <String, GoldPrice>{};
    for (final p in prices) {
      final date = p.recordedDate.split('T').first;
      map.putIfAbsent(date, () => p);
    }
    final sortedKeys = map.keys.toList()..sort();
    return {for (final k in sortedKeys) k: map[k]!};
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('d MMM yyyy', 'en_US').format(date);
    } catch (_) {
      return dateStr;
    }
  }

  String _formatShortDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat.E('en_US').format(date);
    } catch (_) {
      return dateStr;
    }
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
