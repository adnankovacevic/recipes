import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/repository/mock_recipe_repository.dart';
import 'package:recipes/routes.dart';
import 'package:recipes/themes/text_theme_extensions.dart';
import 'package:recipes/views/home/recommended_recipe_card.dart';
import 'package:recipes/widgets/custom_tab_bar.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 80),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          SliverToBoxAdapter(
            child: const SizedBox(height: 16),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Popular category',
                  style: context.textTheme.bodyMedium?.w600),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: CustomTabBar(
                  tabs: categories,
                  selectedIndex: 0,
                  onTabSelected: (index) {
                    debugPrint('Selected category: ${categories[index]}');
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(height: 16),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            recipes: MockRecipeRepository.recipes,
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
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: MockRecipeRepository.recipes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: RecommendedRecipeCard(
                      recipeName: MockRecipeRepository.recipes[index].name,
                      author: MockRecipeRepository.recipes[index].author,
                      imageUrl:
                          MockRecipeRepository.recipes[index].images.first,
                      onTap: () {
                        // Navigator.of(context).push(
                        // MaterialPageRoute(
                        //   builder: (context) => RecipeDetailsView(
                        //       recipe: MockRecipeRepository.recipes[index]),
                        // ),

                        context.goNamed(Routes.recipe,
                            extra: MockRecipeRepository.recipes[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
