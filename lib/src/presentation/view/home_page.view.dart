import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saboreie/src/data/model/slide_item.model.dart';
import 'package:saboreie/src/presentation/widgets/category_item.dart';
import 'package:saboreie/src/presentation/widgets/search_card.dart';
import 'package:saboreie/src/presentation/widgets/slide_item.dart';
import 'package:saboreie/src/utils/providers/provider_riverpod.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(homePageControllerProvider);

    return asyncItems.when(
      data: (items) => _body(items, context),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => const Center(child: Text('Erro ao carregar os itens')),
    );
  }

  Widget _body(List<SlideItemModel> itens, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SearchCard(),
          _buildTitle(title: 'Restaurantes', description: 'Ver tudo (31)'),
          _buildList(
            itens: itens,
            height: MediaQuery.of(context).size.height / 2.6,
            itemBuilder: (item) => SlideItem(item: item),
          ),
          _buildTitle(title: 'Categoria', description: 'Ver tudo (9)',),
          _buildList(
            itens: itens,
            height: MediaQuery.of(context).size.height / 4.6,
            itemBuilder: (item) => CategoryItem(title: item.title, img: item.img),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }

  Widget _buildTitle({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 28,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildList({List<SlideItemModel> itens = const [], required double height, Widget Function(SlideItemModel item)? itemBuilder}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itens.length,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => itemBuilder != null ? itemBuilder(itens[index]) : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
