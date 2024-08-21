import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saboreie/src/presentation/widgets/app_bar_personalized.dart';
import 'package:saboreie/src/utils/providers/provider_riverpod.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(homePageControllerProvider);
    final controller = ref.read(homePageControllerProvider.notifier);

    return Scaffold(
      appBar: AppBarPersonalized(),
      body: _body()
    );
  }

  Widget _body() {
    return SizedBox.shrink();
  }

}
