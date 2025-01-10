import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/repository/recipe_repository.dart';
import 'package:recipes/views/home/recommended_recipe_card.dart';
import 'package:recipes/views/recipe_details/recipe_details_view.dart';

class SeeAllListView extends StatelessWidget {
  const SeeAllListView({super.key, required this.recipes});
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecommendedRecipeCard(
                imageUrl: recipes[index].images.first,
                recipeName: recipes[index].name,
                author: recipes[index].author,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipeDetailsView(recipe: recommendedRecipes[index]),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
