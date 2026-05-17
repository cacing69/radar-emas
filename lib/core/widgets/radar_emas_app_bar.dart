import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radar_emas/core/theme/app_colors.dart';
import 'package:radar_emas/features/about/presentation/screens/about_screen.dart';
import 'package:radar_emas/features/profile/screens/profile_screen.dart';
import 'package:radar_emas/features/settings/screens/settings_screen.dart';

class RadarEmasAppBar extends StatelessWidget {
  final Widget child;
  final GlobalKey _avatarKey = GlobalKey();

  RadarEmasAppBar({super.key, this.child = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: isPortrait ? 60 : 44,
        maxHeight: isPortrait ? 60 : 44,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: isPortrait ? 6 : 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: AppShadows.subtle,
                ),
                child: Align(alignment: Alignment.centerLeft, child: child),
              ),
            ),

            if (isPortrait) ...[
              const Gap(10),
              RadarEmasAvatarMenu(avatarKey: _avatarKey),
            ],
          ],
        ),
      ),
    );
  }
}

class RadarEmasAvatarMenu extends StatelessWidget {
  const RadarEmasAvatarMenu({
    super.key,
    required GlobalKey<State<StatefulWidget>> avatarKey,
  }) : _avatarKey = avatarKey;

  final GlobalKey<State<StatefulWidget>> _avatarKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final avatarContext = _avatarKey.currentContext;
        if (avatarContext == null) return;
        final renderBox = avatarContext.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        showMenu(
          context: context,
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          position: RelativeRect.fromLTRB(
            position.dx,
            position.dy + renderBox.size.height + 8,
            position.dx + renderBox.size.width,
            0,
          ),
          items: <PopupMenuEntry>[
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              height: 28,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Icon(LucideIcons.user, size: 14, color: AppColors.primary),
                  Gap(8),
                  Text('Profile', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              height: 28,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Icon(
                    LucideIcons.settings,
                    size: 14,
                    color: AppColors.primary,
                  ),
                  Gap(8),
                  Text('Settings', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              height: 28,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
              child: const Row(
                children: [
                  Icon(LucideIcons.info, size: 14, color: AppColors.primary),
                  Gap(8),
                  Text('About', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              height: 28,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Row(
                children: [
                  Icon(LucideIcons.logOut, size: 14, color: Colors.red),
                  Gap(8),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      child: Container(
        key: _avatarKey,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: AppShadows.subtle,
        ),
        child: const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          child: Icon(LucideIcons.user, size: 28, color: AppColors.primary),
        ),
      ),
    );
  }
}
