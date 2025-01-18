import 'package:recipes/features/recipe/models/ingridient.dart';

class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.author,
    required this.images,
    required this.rating,
    required this.duration,
    required this.kcal,
    required this.ingredients,
    required this.steps,
  });

  final String id;
  final String name;
  final String author;
  final List<String> images;
  final double rating;
  final int duration;
  final int kcal;
  final List<Ingridient> ingredients;
  final List<String> steps;
}
