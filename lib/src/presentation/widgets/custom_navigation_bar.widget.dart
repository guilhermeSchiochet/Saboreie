import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:saboreie/src/data/model/button_navigation_bar.model.dart';

class CustomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Color backgroundColor;
  final void Function(int) onTabChange;
  final List<ButtonNavigationBarModel> navigationBarButtons;

  const CustomNavigationBarWidget({
    required this.onTabChange,
    required this.backgroundColor,
    required this.navigationBarButtons,
    this.selectedIndex = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                children: List.generate(navigationBarButtons.length, (index) {
                  final button = navigationBarButtons[index];
                  return _Button(
                    index: index,
                    backgroundColor: backgroundColor,
                    active: selectedIndex == index,
                    text: button.titile,
                    icon: button.icon,
                    onTap: () => onTabChange(index),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final int index;
  final bool active;
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;

  const _Button({
    required this.index,
    required this.active,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.backgroundColor,
  });

  static const _animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final showText = active && text.isNotEmpty;

    return TweenAnimationBuilder<int>(
      duration: _animationDuration,
      tween: IntTween(begin: active ? 60 : 160, end: active ? 160 : 60),
      builder: (context, flex, child) {
        return Flexible(flex: flex, child: child!);
      },
      child: GestureDetector(
        onTap: onTap,
        child: TweenAnimationBuilder<Color?>(
          duration: _animationDuration,
          tween: ColorTween(end: active ? backgroundColor.withOpacity(0.4) : Colors.transparent),
          builder: (context, color, child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
              ),
              child: child!,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: SizedBox(
              height: 35, // Limitação da altura do botão
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (showText) const SizedBox(width: 5),
                  Flexible(
                    child: TweenAnimationBuilder<Color?>(
                      duration: _animationDuration,
                      tween: ColorTween(end: active ? backgroundColor : Colors.grey.shade400),
                      builder: (context, iconColor, _) {
                        return Icon(icon, size: 24, color: iconColor);
                      },
                    ),
                  ),
                  if (showText)
                    ...[
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: backgroundColor,
                          ),
                        ),
                      ),
                    ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
