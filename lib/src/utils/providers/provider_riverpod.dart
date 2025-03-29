import 'package:riverpod/riverpod.dart';
import 'package:saboreie/src/data/model/slide_item.model.dart';
import 'package:saboreie/src/presentation/controller/home_page.controller.dart';

final homePageControllerProvider = StateNotifierProvider<HomePageController, AsyncValue<List<SlideItemModel>>>((ref) => HomePageController());