import 'package:flutter/material.dart';
import 'package:radar_emas/core/widgets/radar_emas_nav_bar.dart';
import 'package:radar_emas/features/chart/presentation/screens/chart_screen.dart';
import 'package:radar_emas/features/main_tab/screens/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> selectedMenu = ValueNotifier<int>(0);

  final List<Widget> _tabs = const [
    Center(child: Text('Favorite')),
    Center(child: Text('News')),
    ChartScreen(),
    MainScreen(),
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
      body: SafeArea(
        child: ValueListenableBuilder<int>(
          valueListenable: selectedMenu,
          builder: (context, selected, _) {
            return Stack(
              children: [
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    layoutBuilder: (currentChild, previousChildren) {
                      return Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                        ],
                      );
                    },
                    child: KeyedSubtree(
                      key: ValueKey(selected),
                      child: _tabs[selected],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: RadarEmasNavBar(
                    selectedIndex: selected,
                    onChanged: (index) => selectedMenu.value = index,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
