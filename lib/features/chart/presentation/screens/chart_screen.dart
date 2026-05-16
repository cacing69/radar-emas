import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:radar_emas/core/theme/app_colors.dart';
import 'package:radar_emas/core/widgets/radar_emas_app_bar.dart';
import 'package:radar_emas/features/chart/presentation/providers/chart_provider.dart';
import 'package:radar_emas/features/chart/presentation/widgets/chart_card.dart';

class ChartScreen extends ConsumerWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(selectedSourceProvider);
    final pricesAsync = ref.watch(chartPricesProvider(source));
    final formatter = NumberFormat('#,###', 'id_ID');

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(child: RadarEmasAppBar(child: Text("Provider"))),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const ChartCard(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                    boxShadow: AppShadows.subtle,
                  ),
                  child: pricesAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, _) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            error.toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                          const Gap(12),
                          ElevatedButton(
                            onPressed: () =>
                                ref.invalidate(chartPricesProvider(source)),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                    data: (prices) => SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final price in prices)
                              _PriceListTile(
                                materialType: price.materialType,
                                weight: price.weight % 1 == 0
                                    ? price.weight.toInt().toString()
                                    : price.weight.toString(),
                                unit: price.weightUnit,
                                sellPrice:
                                    'IDR ${formatter.format(price.sellPrice.toInt())}',
                                buybackPrice:
                                    'IDR ${formatter.format(price.buybackPrice.toInt())}',
                              ),
                            Gap(70),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PriceListTile extends StatelessWidget {
  final String materialType;
  final String weight;
  final String unit;
  final String sellPrice;
  final String buybackPrice;

  const _PriceListTile({
    required this.materialType,
    required this.weight,
    required this.unit,
    required this.sellPrice,
    required this.buybackPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 55, maxWidth: 60),
            child: AspectRatio(
              aspectRatio: 2 / 1.5,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weight,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        unit,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  materialType,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Gap(2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                sellPrice,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Text(
                buybackPrice,
                style: const TextStyle(fontSize: 11, color: AppColors.accent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
