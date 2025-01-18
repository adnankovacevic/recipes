import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes/themes/text_theme_extensions.dart';

class RecommendedRecipeCard extends StatelessWidget {
  const RecommendedRecipeCard({
    super.key,
    required this.imageUrl,
    required this.recipeName,
    required this.author,
    required this.onTap,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String imageUrl;
  final String recipeName;
  final String author;
  final void Function()? onTap;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          Text(recipeName, style: context.textTheme.bodySmall),
          Text("By $author", style: context.textTheme.displaySmall),
        ],
      ),
    );
  }
}
