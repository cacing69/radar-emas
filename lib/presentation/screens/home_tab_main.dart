import 'package:flutter/material.dart';
import 'package:radar_emas/presentation/widgets/floating_app_bar.dart';

class HomeTabMain extends StatefulWidget {
  const HomeTabMain({super.key});

  @override
  State<HomeTabMain> createState() => _HomeTabMainState();
}

class _HomeTabMainState extends State<HomeTabMain> {
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
        FloatingAppBar(child: Text("Beranda")),
      ],
    );
  }
}
