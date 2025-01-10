import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/themes/color_palettes.dart';
import 'package:recipes/themes/text_theme_extensions.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton.filled(
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton.filled(
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.bookmark_border),
              ),
            ],
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: recipe.images.first,
                fit: BoxFit.cover,
              ),
            ),
            pinned: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title:
                        Text(recipe.name, style: context.textTheme.titleMedium),
                    subtitle: Text("By ${recipe.author}",
                        style: context.textTheme.bodySmall?.transparent),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 5,
                      children: [
                        Icon(CupertinoIcons.star_fill,
                            color: ColorPalettes.yellow),
                        Text(recipe.rating.toString(),
                            style: context.textTheme.bodySmall?.transparent),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoRow(
                          text: recipe.duration.toString(),
                          icon: CupertinoIcons.timer),
                      InfoRow(
                          text: "Medium",
                          icon: CupertinoIcons.chart_bar_square),
                      InfoRow(
                          text: "${recipe.kcal} kcal",
                          icon: CupertinoIcons.flame),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Ingredients", style: context.textTheme.titleSmall),
                  for (var ingredient in recipe.ingredients)
                    ListTile(
                      title: Text(ingredient.name,
                          style: context.textTheme.bodySmall),
                      trailing: Text(
                          "${ingredient.quantity} ${ingredient.unit.abbreviation}",
                          style: context.textTheme.bodySmall),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.text, required this.icon});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Icon(
          icon,
          color: ColorPalettes.black.withValues(alpha: 0.4),
        ),
        Text(
          text,
          style: context.textTheme.bodySmall?.transparent,
        ),
      ],
    );
  }
}
