import 'package:flutter/material.dart';
import 'package:recipes/themes/color_palettes.dart';

class NotchedBottomNavBar extends StatelessWidget {
  const NotchedBottomNavBar({
    super.key,
    required this.iconPaths,
    required this.currentIndex,
    required this.onIndexChange,
  });

  final List<IconData> iconPaths;
  final int currentIndex;
  final ValueChanged<int> onIndexChange;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // padding: const EdgeInsets.only(top: 30),
      elevation: 0,
      height: 66,
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              iconPaths.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () => onIndexChange(index),
                  child: Icon(
                    iconPaths[index],
                    color: currentIndex == index
                        ? ColorPalettes.primary
                        : ColorPalettes.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
