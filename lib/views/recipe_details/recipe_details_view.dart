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
      backgroundColor: Colors.white,
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
            pinned: true,
            floating: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                width: double.maxFinite,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    ListTile(
                      title: Text(
                        recipe.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        "By ${recipe.author}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            recipe.rating.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoRow(
                          text: "${recipe.duration} min",
                          icon: CupertinoIcons.timer,
                        ),
                        InfoRow(
                          text: "Medium",
                          icon: CupertinoIcons.chart_bar_square,
                        ),
                        InfoRow(
                          text: "${recipe.kcal} kcal",
                          icon: CupertinoIcons.flame,
                        ),
                      ],
                    ),
                    Text(
                      "Ingredients",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    for (var ingredient in recipe.ingredients)
                      ListTile(
                        title: Text(
                          ingredient.name,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: Text(
                          "${ingredient.quantity} ${ingredient.unit.abbreviation}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
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
