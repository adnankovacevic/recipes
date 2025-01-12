import 'package:flutter/material.dart';
import 'package:recipes/themes/color_palettes.dart';
import 'package:recipes/themes/text_theme_extensions.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    this.activeBackgroundColor = ColorPalettes.primary,
    this.inactiveBackgroundColor = Colors.transparent,
    this.activeTextColor = Colors.white,
    this.inactiveTextColor = ColorPalettes.primary,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color activeTextColor;
  final Color inactiveTextColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 4,
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? activeBackgroundColor : Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tabs[index],
                style: isSelected
                    ? context.textTheme.labelMedium
                        ?.copyWith(color: activeTextColor)
                    : context.textTheme.labelMedium
                        ?.copyWith(color: inactiveTextColor),
              ),
            ),
          );
        }),
      ),
    );
  }
}
