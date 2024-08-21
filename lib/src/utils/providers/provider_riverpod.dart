import 'package:riverpod/riverpod.dart';
import 'package:saboreie/src/presentation/controller/home_page.controller.dart';

final homePageControllerProvider = StateNotifierProvider<HomePageController, int>((ref) => HomePageController());
