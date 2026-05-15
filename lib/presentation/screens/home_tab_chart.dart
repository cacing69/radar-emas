import 'package:flutter/material.dart';
import 'package:radar_emas/presentation/widgets/floating_app_bar.dart';

class HomeTabChart extends StatefulWidget {
  const HomeTabChart({super.key});

  @override
  State<HomeTabChart> createState() => _HomeTabChartState();
}

class _HomeTabChartState extends State<HomeTabChart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
        FloatingAppBar(child: Text("Nama Toko")),
      ],
    );
  }
}
