import 'package:flutter/material.dart';
import 'package:recipes/features/recipe/models/recipe.dart';
import 'package:recipes/features/home/recommended_recipe_card.dart';
import 'package:recipes/features/recipe/recipe_view.dart';

class SeeAllListView extends StatelessWidget {
  const SeeAllListView({super.key, required this.recipes});
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommended"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return RecommendedRecipeCard(
                    imageUrl: recipes[index].images.first,
                    recipeName: recipes[index].name,
                    author: recipes[index].author,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecipeView(
                            recipe: recipes[index],
                          ),
                        ),
                      );
                    },
                  );
                },
                childCount: recipes.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
