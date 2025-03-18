import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saboreie/src/data/model/button_navigation_bar.model.dart';

import 'package:saboreie/src/presentation/view/home_page.view.dart';
import 'package:saboreie/src/presentation/view/profile_page.view.dart';
import 'package:saboreie/src/presentation/view/settings_page.view.dart';
import 'package:saboreie/src/presentation/widgets/custom_navigation_bar.widget.dart';

class ScaffoldMainScreen extends StatefulWidget {
  const ScaffoldMainScreen({super.key});

  @override
  _ScaffoldMainScreenState createState() => _ScaffoldMainScreenState();
}

class _ScaffoldMainScreenState extends State<ScaffoldMainScreen> {
  PageController _pageController = PageController();

  int _page = 0;

  List<ButtonNavigationBarModel> icons = [
    ButtonNavigationBarModel(
      titile: 'Home',
      icon: LucideIcons.home
    ),
    ButtonNavigationBarModel(
      titile: 'Notification',
      icon: Icons.notifications_outlined
    ),
    ButtonNavigationBarModel(
      titile: 'Profile',
      icon: LucideIcons.user
    ),
  ];

  List pages = const [
    HomePageView(),
    ProfilePageView(),
    SettingsPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(3, (index) =>  pages[index] ),
      ),
      bottomNavigationBar: CustomNavigationBarWidget(
        selectedIndex: _page,
        backgroundColor: Colors.orange.shade700,
        navigationBarButtons: icons,
        onTabChange: (idx) {
          onPageChanged(idx);
        },
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}