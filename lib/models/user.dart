import 'package:recipes/models/recipe.dart';

class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.recipes,
  });

  final String id;
  final String name;
  final String email;
  final String image;
  final List<Recipe> recipes;
}
