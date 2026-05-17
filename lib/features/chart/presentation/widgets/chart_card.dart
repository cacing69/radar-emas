import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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
  int? _touchedIndex;

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
        _touchedIndex = null;
      }
    });

    final prices = historyAsync?.asData?.value ?? [];
    final grouped = _groupByDate(prices);
    final dates = grouped.keys.toList();

    final currentIndex = _touchedIndex ??
        (dates.isNotEmpty ? dates.length - 1 : null);
    final hasPrev = currentIndex != null && currentIndex > 0;

    final current = currentIndex != null && currentIndex < dates.length
        ? grouped[dates[currentIndex]]!
        : selectedPrice ?? const GoldPrice();
    final prev = hasPrev ? grouped[dates[currentIndex - 1]]! : null;

    final buyback = current.buybackPrice;
    final sell = current.sellPrice;
    final buybackDiff = prev != null ? buyback - prev.buybackPrice : null;
    final sellDiff = prev != null ? sell - prev.sellPrice : null;
    final spread = buyback - sell;

    final dateText = currentIndex != null && currentIndex < dates.length
        ? _formatDate(dates[currentIndex])
        : '';

    final fmt = NumberFormat('#,###', 'id_ID');

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
                  Text(
                    dateText,
                    style: const TextStyle(
                      fontSize: 14,
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
                          _Legend(
                            color: AppColors.accent,
                            label: 'Buyback',
                            diff: buybackDiff,
                          ),
                          Text(
                            'IDR ${fmt.format(buyback)}',
                            style: const TextStyle(
                              fontSize: 16,
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
                          _Legend(
                            color: AppColors.primary,
                            label: 'Sell',
                            diff: sellDiff,
                          ),
                          Text(
                            'IDR ${fmt.format(sell)}',
                            style: const TextStyle(
                              fontSize: 16,
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
              if (!isLoading && currentIndex != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Spread: IDR ${fmt.format(spread.abs())}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
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
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      LucideIcons.chartNoAxesCombined,
                                      size: 40,
                                      color: Colors.grey.shade300,
                                    ),
                                    const Gap(16),
                                    Text(
                                      'No Data',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      'Price history is not available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
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
                final idx = buyback.x.toInt();
                if (idx >= 0 && idx < dates.length) {
                  setState(() {
                    _touchedIndex = idx;
                  });
                }
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
  final double? diff;

  const _Legend({required this.color, required this.label, this.diff});

  @override
  Widget build(BuildContext context) {
    final diffText = diff != null ? _formatDiff(diff!) : null;
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
        if (diffText != null) ...[
          Gap(6),
          Text(
            diffText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: diff == 0
                  ? AppColors.primary
                  : diff! > 0
                      ? Colors.green
                      : Colors.red,
            ),
          ),
        ],
      ],
    );
  }

  String _formatDiff(double value) {
    final fmt = NumberFormat('#,###', 'id_ID');
    final sign = value > 0 ? '+' : value < 0 ? '-' : '';
    return '$sign${fmt.format(value.abs())}';
  }
}
