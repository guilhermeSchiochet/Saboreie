import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saboreie/src/data/model/slide_item.model.dart';
import 'package:saboreie/src/presentation/widgets/search_card.dart';
import 'package:saboreie/src/presentation/widgets/slide_item.dart';
import 'package:saboreie/src/utils/providers/provider_riverpod.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(homePageControllerProvider);
    final controller = ref.read(homePageControllerProvider.notifier);

    return asyncItems.when(
      data: (items) => _body(items, context),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => const Center(child: Text('Erro ao carregar os itens')),
    );
  }

  Widget _body(List<SlideItemModel> itens, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // SearchCard(),
          _text(),
          const SizedBox(height: 10),
          _buildList(itens, context),
        ],
      ),
    );
  }

  Widget _text() {
    return const Text(
      'Restaurantes',
      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
    );
  }

  Widget _buildList(List<SlideItemModel> itens, BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.6,
      child: ListView.builder(
        itemCount: itens.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) => SlideItem(item: itens[index]),
      ),
    );
  }
}
