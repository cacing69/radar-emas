import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radar_emas/core/providers/app_info_provider.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final versionAsync = ref.watch(appVersionProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("About"),
            versionAsync.when(
              data: (version) => Text(version),
              loading: () => const Text("v..."),
              error: (_, __) => const Text("v1.0.0"),
            ),
          ],
        ),
      ),
    );
  }
}
