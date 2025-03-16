import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saboreie/src/presentation/widgets/search_card.dart';
import 'package:saboreie/src/utils/providers/provider_riverpod.dart';

class SettingsPageView extends ConsumerWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  return Scaffold(
      body: _body()
    );
  }

  Widget _body() {
    return Column(
      children: [
        
      ],
    );
  }

}
