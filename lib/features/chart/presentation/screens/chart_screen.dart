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
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
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
    final selectedChartPrice = ref.watch(selectedChartPriceProvider);

    final sources = sourcesAsync.asData?.value ?? [];
    final selectedSource = sources.cast<Source?>().firstWhere(
      (s) => s?.name == source,
      orElse: () => null,
    );
    final currencyFormat = NumberFormat('#,###', 'id_ID');

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Auto-select first price when data loads and nothing is selected
    final prices = pricesAsync.asData?.value;
    if (selectedChartPrice == null && prices != null && prices.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(selectedChartPriceProvider.notifier).select(prices.first);
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: isPortrait
          ? PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: GestureDetector(
                onTap: () => _showSourceSheet(context, ref),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                loading: () => Skeletonizer(
                  enabled: true,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Gap(10),
                          for (final _ in List.generate(5, (i) => i))
                            _PriceListTile(
                              price: GoldPrice(
                                materialType: 'Emas Antam',
                                weight: 1,
                                weightUnit: 'gr',
                                sellPrice: 1500000,
                                buybackPrice: 1400000,
                                currency: 'IDR',
                              ),
                              currencyFormat: currencyFormat,
                              isSelected: false,
                              onTap: () {},
                            ),
                          Gap(10),
                        ],
                      ),
                    ),
                  ),
                ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10),
                        for (final price in prices)
                          _PriceListTile(
                            price: price,
                            currencyFormat: currencyFormat,
                            isSelected: selectedChartPrice == price,
                            onTap: () => ref
                                .read(selectedChartPriceProvider.notifier)
                                .select(price),
                          ),
                        Gap(10),
                        isPortrait ? Gap(70) : const SizedBox.shrink(),
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
                    topRight: isPortrait ? Radius.zero : Radius.circular(16),
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
                    ChartCard(isPortrait: isPortrait),
                    Expanded(child: priceList),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
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
                                    selectedSource?.displayName ??
                                        'Select Provider',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Gap(7),
                        Expanded(child: priceList),
                      ],
                    ),
                  ),
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
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  var query = '';
  var displayQuery = '';
  Timer? debounce;

  final sheetContent = StatefulBuilder(
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
                  debounce?.cancel();
                  debounce = Timer(const Duration(milliseconds: 300), () {
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
                          color: isSelected ? AppColors.accent : Colors.grey,
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
                      ref.read(selectedSourceProvider.notifier).select(s.name);
                      ref.read(selectedChartPriceProvider.notifier).clear();
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

  if (isPortrait) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => sheetContent,
    );
  } else {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      pageBuilder: (context, anim1, anim2) => Align(
        alignment: Alignment.centerLeft,
        child: Material(
          color: Colors.white,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(16),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(children: [Expanded(child: sheetContent)]),
          ),
        ),
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }
}

class _PriceListTile extends StatelessWidget {
  final GoldPrice price;
  final NumberFormat currencyFormat;
  final bool isSelected;
  final VoidCallback onTap;

  const _PriceListTile({
    required this.price,
    required this.currencyFormat,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.06) : null,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
                              formatCompact(price.weight),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              price.weightUnit,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          price.currency,
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
                    price.materialType,
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
                  currencyFormat.format(price.sellPrice.toInt()),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  price.buybackPrice.toInt() > 0
                      ? currencyFormat.format(price.buybackPrice.toInt())
                      : '-',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.accent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
