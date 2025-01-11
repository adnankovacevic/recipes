import 'package:flutter/material.dart';
import 'package:recipes/repository/recipe_repository.dart';
import 'package:recipes/themes/text_theme_extensions.dart';
import 'package:recipes/views/home/category_item.dart';
import 'package:recipes/views/home/recommended_recipe_card.dart';
import 'package:recipes/views/recipe_details/recipe_details_view.dart';
import 'package:recipes/widgets/see_all_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'All',
      'Italian',
      'Asian',
      'Chinese',
      'Indian',
      'Mexican',
      'French',
      'Japanese',
      'American',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    'Hello, Joanne!',
                    style: context.textTheme.bodySmall?.transparent,
                  ),
                  Text(
                    "What would you like to cook today?",
                    style: context.textTheme.titleMedium?.w600,
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: const SizedBox(height: 16),
            ),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories', style: context.textTheme.bodyMedium?.w600),
                  TextButton(
                    onPressed: () {
                      debugPrint('See all categories');
                    },
                    child: Text(
                      'See all',
                      style: context.textTheme.bodySmall?.w600.primary,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      title: categories[index],
                      imageUrl: 'imageUrl',
                      isSelected: index == 0,
                      selected: () {
                        debugPrint('Selected category: ${categories[index]}');
                      },
                    );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: const SizedBox(height: 16),
            ),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recommendation',
                      style: context.textTheme.bodyMedium?.w600),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SeeAllListView(
                            recipes: recommendedRecipes,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'See all',
                      style: context.textTheme.bodySmall?.w600.primary,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 240,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedRecipes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: RecommendedRecipeCard(
                        recipeName: recommendedRecipes[index].name,
                        author: recommendedRecipes[index].author,
                        imageUrl: recommendedRecipes[index].images.first,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailsView(
                                  recipe: recommendedRecipes[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),

            // Recipes of the week section
          ],
        ),
      ),
    );
  }
}
