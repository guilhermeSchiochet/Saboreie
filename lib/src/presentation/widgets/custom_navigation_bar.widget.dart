import 'package:flutter/material.dart';
import 'package:saboreie/src/data/model/button_navigation_bar.model.dart';

class CustomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Color? activeColor;
  final void Function(int) onTabChange;
  final List<ButtonNavigationBarModel> items;

  const CustomNavigationBarWidget({
    required this.onTabChange,
    this.activeColor,
    required this.items,
    this.selectedIndex = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
              BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              return _NavItem(
                index: index,
                active: selectedIndex == index,
                text: item.title,
                icon: item.icon,
                activeColor: activeColor ?? Colors.grey.shade600,
                onTap: () => onTabChange(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final bool active;
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color activeColor;

  const _NavItem({
    required this.index,
    required this.active,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        tween: Tween<double>(begin: 1.0, end: active ? 1.15 : 1.0),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: active ? activeColor.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  TweenAnimationBuilder<Color?>(
                    duration: const Duration(milliseconds: 200),
                    tween: ColorTween(
                      begin: Colors.black54,
                      end: active ? activeColor : Colors.black54,
                    ),
                    builder: (context, color, _) {
                      return Icon(
                        icon,
                        size: 20,
                        color: color,
                      );
                    },
                  ),
                  if(active) ...[
                    const SizedBox(width: 6),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: activeColor,
                      )
                    )
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
