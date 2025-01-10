import 'package:recipes/models/recipe.dart';

class Category {
  const Category({
    required this.id,
    required this.name,
    required this.image,
    required this.recipes,
  });

  final String id;
  final String name;
  final String image;
  final List<Recipe> recipes;
}
