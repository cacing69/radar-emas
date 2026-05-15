import 'package:flutter/material.dart';
import 'package:radar_emas/presentation/screens/home_tab_chart.dart';
import 'package:radar_emas/presentation/screens/home_tab_main.dart';
import 'package:radar_emas/presentation/widgets/floating_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> selectedMenu = ValueNotifier<int>(0);

  final List<Widget> _tabs = const [
    Center(child: Text('Favorite')),
    Center(child: Text('News')),
    HomeTabChart(),
    HomeTabMain(),
  ];

  @override
  void dispose() {
    selectedMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // appBar: AppBar(title: const Text('Home Page')),
      body: SafeArea(
        child: Stack(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: selectedMenu,
              builder: (context, selected, _) {
                return Stack(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      child: KeyedSubtree(
                        key: ValueKey(selected),
                        child: _tabs[selected],
                      ),
                    ),
                    FloatingNavBar(
                      selectedIndex: selected,
                      onChanged: (index) => selectedMenu.value = index,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
