import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radar_emas/core/theme/app_colors.dart';
import 'package:radar_emas/features/profile/screens/profile_screen.dart';
import 'package:radar_emas/features/settings/screens/settings_screen.dart';

class RadarEmasAppBar extends StatelessWidget {
  final Widget child;
  final GlobalKey _avatarKey = GlobalKey();

  RadarEmasAppBar({super.key, this.child = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 70, maxHeight: 70),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: AppShadows.subtle,
                ),
                child: SizedBox.expand(
                  child: Align(alignment: Alignment.centerLeft, child: child),
                ),
              ),
            ),
            const Gap(10),
            GestureDetector(
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 0,
                      ),
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
                          Icon(
                            LucideIcons.user,
                            size: 14,
                            color: AppColors.primary,
                          ),
                          Gap(8),
                          Text('Profile', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 0,
                      ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 0,
                      ),
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
                            LucideIcons.info,
                            size: 14,
                            color: AppColors.primary,
                          ),
                          Gap(8),
                          Text('About', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 0,
                      ),
                      height: 28,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Logout'),
                            content: const Text(
                              'Are you sure you want to logout?',
                            ),
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
                  backgroundColor: Colors.white,
                  child: Icon(
                    LucideIcons.user,
                    size: 24,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
