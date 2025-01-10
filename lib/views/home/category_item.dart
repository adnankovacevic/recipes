import 'package:flutter/material.dart';
import 'package:recipes/themes/color_palettes.dart';
import 'package:recipes/themes/text_theme_extensions.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.selected,
    required this.isSelected,
  });
  final String title;
  final String imageUrl;
  final void Function()? selected;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        spacing: 10,
        children: [
          GestureDetector(
            onTap: selected,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorPalettes.primary
                    : ColorPalettes.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Icon(Icons.fastfood),
                  Text(title,
                      style: isSelected
                          ? context.textTheme.bodySmall?.white
                          : context.textTheme.bodySmall?.transparent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
