import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saboreie/src/config/theme/app_theme.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPageView extends ConsumerWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _buildContainerAvatar(),
        const SizedBox(height: 50),
        Expanded(
          child: SettingsList(
            sections: [
              SettingsSection(
                title: const Text('Configurações'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(
                      Icons.color_lens_outlined
                    ),
                    title: const Text('Tema'),
                    value: const Text('Claro'),
                  ),
                  SettingsTile.switchTile(
                    onToggle: (value) {},
                    initialValue: true,
                    leading: const Icon(Icons.format_paint),
                    title: const Text('Enable custom theme'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContainerAvatar() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: const Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 50
              ),
            ),
            Positioned(
              bottom: -5,
              right: 10,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppTheme.defaultLightColor,
                child: Icon(
                  LucideIcons.camera,
                  color: Colors.white,
                  size: 24
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
