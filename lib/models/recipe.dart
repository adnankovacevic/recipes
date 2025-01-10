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

class Ingridient {
  const Ingridient({
    required this.name,
    required this.quantity,
    this.unit = UnitType.piece,
  });

  final String name;
  final int quantity;
  final UnitType unit;
}

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

enum UnitType {
  gram('Gram', 'g', 'Weight'),
  kilogram('Kilogram', 'kg', 'Weight'),
  liter('Liter', 'L', 'Volume'),
  milliliter('Milliliter', 'mL', 'Volume'),
  piece('Piece', 'pcs', 'Count'),
  teaspoon('Teaspoon', 'tsp', 'Cooking'),
  tablespoon('Tablespoon', 'tbsp', 'Cooking'),
  cup('Cup', 'cup', 'Cooking'),
  pinch('Pinch', 'pn', 'Cooking'),
  dash('Dash', 'ds', 'Cooking'),
  drop('Drop', 'dp', 'Cooking'),
  smidgen('Smidgen', 'sm', 'Cooking'),
  handful('Handful', 'hf', 'Count'),
  quart('Quart', 'qt', 'Volume'),
  gallon('Gallon', 'gal', 'Volume'),
  ounce('Ounce', 'oz', 'Weight/Volume'),
  milligram('Milligram', 'mg', 'Weight');

  const UnitType(this.fullName, this.abbreviation, this.category);

  final String fullName;
  final String abbreviation;
  final String category;

  String get byString => '$fullName ($abbreviation) - $category';
}
