import 'package:riverpod/riverpod.dart';
import 'package:saboreie/src/data/model/slide_item.model.dart';

class HomePageController extends StateNotifier<AsyncValue<List<SlideItemModel>>> {
  HomePageController() : super(const AsyncValue.loading()) {
    fetchItems(); // Busca os itens assim que o controller é instanciado
  }

  Future<void> fetchItems() async {
    try {
      state = const AsyncValue.loading();

      await Future.delayed(const Duration(seconds: 2)); // Simula um tempo de carregamento

      state = const AsyncValue.data(
        [
          SlideItemModel(
            img: 'assets/hamburguer.png',
            title: 'Hambúrguer Gourmet',
            description: 'Experimente o nosso Hambúrguer Clássico Gourmet, uma explosão de sabores que vai te conquistar na primeira mordida! Feito com um suculento patty de carne bovina grelhado na perfeição, coberto com queijo cheddar derretido que escorre de forma irresistível. Acompanhado de picles crocantes, cebola picada, ketchup e mostarda, tudo isso abraçado por um pão macio e dourado, recém-assado. Servido em uma tábua rústica, este hambúrguer é a escolha perfeita para quem busca qualidade e sabor autêntico. Peça já o seu e viva essa experiência deliciosa! 🍔',
            rating: 4.8
          ),
          SlideItemModel(
            img: 'assets/pizza_calabresa.png',
            title: 'Pizza de Calabresa',
            description: 'A clássica pizza de calabresa que todo mundo ama! Uma base crocante e dourada, coberta com molho de tomate artesanal, fatias generosas de calabresa levemente apimentada e queijo mussarela derretido até a perfeição. Finalizada com orégano e um toque especial de cebola, essa pizza é perfeita para qualquer momento. Peça agora e aproveite cada fatia! 🍕',
            rating: 4.7
          ),
          SlideItemModel(
            img: 'assets/sushi_salmao.png',
            title: 'Sushi de Salmão',
            description: 'Uma seleção irresistível de sushi de salmão fresco, preparado com os melhores ingredientes. Nigiri com cortes delicados de salmão, sashimi que derrete na boca e rolls especiais combinando arroz temperado, alga nori e cream cheese. Uma experiência única para os amantes da culinária japonesa. Faça seu pedido e aproveite essa delícia! 🍣',
            rating: 4.9
          ),
        ]
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}