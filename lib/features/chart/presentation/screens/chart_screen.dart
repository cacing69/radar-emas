import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:radar_emas/core/theme/app_colors.dart';
import 'package:radar_emas/core/util/format_helper.dart';
import 'package:radar_emas/core/widgets/radar_emas_app_bar.dart';
import 'package:radar_emas/features/chart/domain/entities/source.dart';
import 'package:radar_emas/features/chart/presentation/providers/chart_provider.dart';
import 'package:radar_emas/features/chart/presentation/widgets/chart_card.dart';

class ChartScreen extends ConsumerWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(selectedSourceProvider);
    final pricesAsync = ref.watch(chartPricesProvider(source));
    final sourcesAsync = ref.watch(sourcesProvider);

    final sources = sourcesAsync.asData?.value ?? [];
    final selectedSource = sources.cast<Source?>().firstWhere(
      (s) => s?.name == source,
      orElse: () => null,
    );
    final currencyFormat = NumberFormat('#,###', 'id_ID');

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: isPortrait
          ? PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: SafeArea(
                child: GestureDetector(
                  onTap: () => _showSourceSheet(context, ref),
                  child: RadarEmasAppBar(
                    child: Skeletonizer(
                      enabled: sourcesAsync.isLoading,
                      child: Row(
                        children: [
                          Gap(5),
                          Icon(
                            LucideIcons.arrowLeftRight,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          Gap(10),
                          Text(
                            selectedSource?.displayName ?? 'Select Provider',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: OrientationBuilder(
            builder: (context, orientation) {
              final isPortrait = orientation == Orientation.portrait;

              final priceListContent = pricesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
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
                            weight: formatCompact(price.weight),
                            unit: price.weightUnit,
                            currency: price.currency,
                            sellPrice: currencyFormat.format(
                              price.sellPrice.toInt(),
                            ),
                            buybackPrice: price.buybackPrice.toInt() > 0
                                ? currencyFormat.format(
                                    price.buybackPrice.toInt(),
                                  )
                                : '-',
                          ),
                        Gap(70),
                      ],
                    ),
                  ),
                ),
              );

              final priceList = Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: isPortrait ? Radius.zero : Radius.circular(16),
                    topRight: isPortrait ? Radius.zero : Radius.zero,
                    bottomRight: isPortrait ? Radius.circular(16) : Radius.zero,
                    bottomLeft: isPortrait
                        ? Radius.circular(16)
                        : Radius.circular(16),
                  ),
                  boxShadow: AppShadows.subtle,
                ),
                child: priceListContent,
              );

              if (isPortrait) {
                return Column(
                  children: [
                    const ChartCard(),
                    Expanded(child: priceList),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(child: priceList),
                  const Gap(6),
                  Expanded(child: ChartCard(isPortrait: isPortrait)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

void _showSourceSheet(BuildContext context, WidgetRef ref) {
  final sources = ref.read(sourcesProvider).asData?.value ?? [];
  final selected = ref.read(selectedSourceProvider);

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      var query = '';
      var displayQuery = '';
      Timer? _debounce;

      return StatefulBuilder(
        builder: (ctx, setState) {
          final filtered = sources.where((s) {
            return s.displayName.toLowerCase().contains(query.toLowerCase());
          }).toList();

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Text(
                    'Select Provider',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                    onChanged: (v) {
                      displayQuery = v;
                      setState(() {});
                      _debounce?.cancel();
                      _debounce = Timer(const Duration(milliseconds: 300), () {
                        query = displayQuery;
                        setState(() {});
                      });
                    },
                  ),
                ),
                const Gap(8),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, indent: 16, endIndent: 16),
                    itemBuilder: (_, i) {
                      final s = filtered[i];
                      final isSelected = s.name == selected;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: isSelected
                              ? AppColors.accent.withValues(alpha: 0.2)
                              : Colors.grey.shade100,
                          child: Text(
                            s.displayName[0],
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.accent
                                  : Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        title: Text(
                          s.displayName,
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                        trailing: isSelected
                            ? const Icon(Icons.check, color: AppColors.accent)
                            : null,
                        onTap: () {
                          ref
                              .read(selectedSourceProvider.notifier)
                              .select(s.name);
                          Navigator.pop(ctx);
                        },
                      );
                    },
                  ),
                ),
                Gap(8),
              ],
            ),
          );
        },
      );
    },
  );
}

class _PriceListTile extends StatelessWidget {
  final String materialType;
  final String weight;
  final String unit;
  final String currency;
  final String sellPrice;
  final String buybackPrice;

  const _PriceListTile({
    required this.materialType,
    required this.weight,
    required this.currency,
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
              aspectRatio: 2 / 1.7,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
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
                      Text(
                        currency,
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
