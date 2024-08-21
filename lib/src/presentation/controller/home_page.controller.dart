import 'package:riverpod/riverpod.dart';

class HomePageController extends StateNotifier<int> {
  HomePageController() : super(0); // Estado inicial é 0

  void increment() {
    state++; // Incrementa o estado
  }

  void decrement() {
    state--; // Decrementa o estado
  }
}
