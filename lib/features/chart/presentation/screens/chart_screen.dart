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
    final pricesAsync = ref.watch(chartPricesProvider);
    final formatter = NumberFormat('#,###', 'id_ID');

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(child: RadarEmasAppBar(child: Text("Chart Page"))),
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
                                ref.invalidate(chartPricesProvider),
                            child: const Text('Coba Lagi'),
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
                                weight:
                                    '${price.weight.toInt()} ${price.weightUnit}',
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
  final String sellPrice;
  final String buybackPrice;

  const _PriceListTile({
    required this.materialType,
    required this.weight,
    required this.sellPrice,
    required this.buybackPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.accent.withValues(alpha: 0.2),
            child: const Icon(Icons.monetization_on, color: AppColors.accent),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  materialType,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(2),
                Text(
                  weight,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
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
