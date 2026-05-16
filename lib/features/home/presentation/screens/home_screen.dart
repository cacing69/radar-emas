import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radar_emas/core/theme/app_colors.dart';
import 'package:radar_emas/core/widgets/nav_item.dart';
import 'package:radar_emas/core/widgets/radar_emas_nav_bar.dart';
import 'package:radar_emas/features/chart/presentation/screens/chart_screen.dart';
import 'package:radar_emas/features/main/presentation/screens/main_screen.dart';

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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: ValueListenableBuilder<int>(
          valueListenable: selectedMenu,
          builder: (context, selected, _) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: isPortrait ? 0 : 60,
                  right: 0,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    layoutBuilder: (currentChild, previousChildren) {
                      return Stack(
                        alignment: Alignment.topCenter,
                        children: [...previousChildren, ?currentChild],
                      );
                    },
                    child: KeyedSubtree(
                      key: ValueKey(selected),
                      child: _tabs[selected],
                    ),
                  ),
                ),
                if (!isPortrait)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: RadarEmasNavBar(
                      selectedIndex: selected,
                      onChanged: (index) => selectedMenu.value = index,
                    ),
                  ),
                if (isPortrait)
                  Positioned(
                    bottom: 5,
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

// class _SideNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final ValueChanged<int> onChanged;

//   const _SideNavBar({required this.selectedIndex, required this.onChanged});

//   static const _icons = [
//     LucideIcons.star,
//     LucideIcons.newspaper,
//     LucideIcons.chartNoAxesCombined,
//     LucideIcons.house,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: AppShadows.subtle,
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: List.generate(_icons.length, (index) {
//                 final selected = selectedIndex == index;
//                 return GestureDetector(
//                   onTap: () => onChanged(index),
//                   child: NavItem(icon: _icons[index], selected: selected),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
