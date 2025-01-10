import 'package:recipes/enums/unit_type.dart';
import 'package:recipes/models/ingridient.dart';
import 'package:recipes/models/recipe.dart';

class RecipeRepository {
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(const Duration(seconds: 1));
    return recommendedRecipes;
  }

  Future<Recipe> fetchRecipeById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final recipe = recommendedRecipes.firstWhere((recipe) => recipe.id == id);
      return recipe;
    } catch (e) {
      throw Exception('Recipe with ID $id not found.');
    }
  }
}

List<Recipe> recommendedRecipes = [
  Recipe(
    id: 'carbonara',
    name: 'Spaghetti Carbonara',
    author: 'Tom Sawyer',
    images: [
      'https://images.unsplash.com/photo-1560434019-4558f9a9e2a1?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ],
    rating: 4.5,
    duration: 25,
    kcal: 450,
    ingredients: [
      Ingridient(name: 'Spaghetti', quantity: 200, unit: UnitType.gram),
      Ingridient(name: 'Eggs', quantity: 2, unit: UnitType.piece),
      Ingridient(name: 'Parmesan Cheese', quantity: 50, unit: UnitType.gram),
      Ingridient(name: 'Chicken', quantity: 100, unit: UnitType.gram),
      Ingridient(name: 'Black Pepper', quantity: 1, unit: UnitType.teaspoon),
      Ingridient(name: 'Salt', quantity: 1, unit: UnitType.teaspoon),
    ],
    steps: [
      'Boil spaghetti in salted water until al dente.',
      'In a bowl, mix eggs and grated Parmesan cheese.',
      'Cook chicken fillet in a pan until crispy.',
      'Drain spaghetti and mix it with chicken fillet off heat.',
      'Quickly stir in the egg mixture to coat the pasta.',
      'Serve with black pepper and extra Parmesan cheese.'
    ],
  ),
  Recipe(
    id: 'chicken_tikka',
    name: 'Chicken Tikka Masala',
    author: 'Lucy Brown',
    images: [
      'https://images.unsplash.com/photo-1560434019-4558f9a9e2a1?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ],
    rating: 4.8,
    duration: 40,
    kcal: 650,
    ingredients: [
      Ingridient(name: 'Chicken Breast', quantity: 500, unit: UnitType.gram),
      Ingridient(name: 'Yogurt', quantity: 100, unit: UnitType.gram),
      Ingridient(name: 'Garlic', quantity: 2, unit: UnitType.teaspoon),
      Ingridient(name: 'Ginger', quantity: 2, unit: UnitType.teaspoon),
      Ingridient(name: 'Turmeric Powder', quantity: 1, unit: UnitType.teaspoon),
      Ingridient(name: 'Cumin Powder', quantity: 1, unit: UnitType.teaspoon),
      Ingridient(name: 'Paprika', quantity: 1, unit: UnitType.teaspoon),
      Ingridient(name: 'Tomato Puree', quantity: 200, unit: UnitType.gram),
      Ingridient(name: 'Cream', quantity: 100, unit: UnitType.milliliter),
      Ingridient(name: 'Salt', quantity: 1, unit: UnitType.teaspoon),
    ],
    steps: [
      'Marinate chicken with yogurt, garlic, ginger, turmeric, cumin, and paprika for 30 minutes.',
      'Cook the marinated chicken in a pan until lightly browned.',
      'In the same pan, sauté tomato puree with spices.',
      'Add cream and simmer until thickened.',
      'Mix the cooked chicken into the sauce and simmer for 10 minutes.',
      'Serve with rice or naan bread.'
    ],
  ),
  Recipe(
    id: 'chocolate_cake',
    name: 'Chocolate Cake',
    author: 'Jeqlyn Smith',
    images: [
      'https://images.unsplash.com/photo-1560434019-4558f9a9e2a1?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ],
    rating: 5.0,
    duration: 60,
    kcal: 350,
    ingredients: [
      Ingridient(name: 'All-purpose Flour', quantity: 200, unit: UnitType.gram),
      Ingridient(name: 'Cocoa Powder', quantity: 50, unit: UnitType.gram),
      Ingridient(name: 'Sugar', quantity: 150, unit: UnitType.gram),
      Ingridient(name: 'Butter', quantity: 100, unit: UnitType.gram),
      Ingridient(name: 'Eggs', quantity: 2, unit: UnitType.piece),
      Ingridient(name: 'Milk', quantity: 200, unit: UnitType.milliliter),
      Ingridient(name: 'Baking Powder', quantity: 1, unit: UnitType.teaspoon),
      Ingridient(name: 'Vanilla Extract', quantity: 1, unit: UnitType.teaspoon),
    ],
    steps: [
      'Preheat oven to 180°C (350°F).',
      'Mix flour, cocoa powder, sugar, and baking powder.',
      'Add butter, eggs, milk, and vanilla extract to the dry ingredients.',
      'Whisk until smooth and pour into a greased baking pan.',
      'Bake for 30-35 minutes or until a toothpick comes out clean.',
      'Cool and decorate with frosting or powdered sugar.'
    ],
  ),
  Recipe(
    id: 'caesar_salad',
    name: 'Caesar Salad',
    author: 'Kelly Johnson',
    images: [
      'https://images.unsplash.com/photo-1560434019-4558f9a9e2a1?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ],
    rating: 4.7,
    duration: 15,
    kcal: 300,
    ingredients: [
      Ingridient(name: 'Romaine Lettuce', quantity: 1, unit: UnitType.piece),
      Ingridient(name: 'Croutons', quantity: 50, unit: UnitType.gram),
      Ingridient(name: 'Parmesan Cheese', quantity: 30, unit: UnitType.gram),
      Ingridient(name: 'Caesar Dressing', quantity: 50, unit: UnitType.gram),
      Ingridient(name: 'Chicken Breast', quantity: 200, unit: UnitType.gram),
      Ingridient(name: 'Olive Oil', quantity: 1, unit: UnitType.tablespoon),
    ],
    steps: [
      'Grill or pan-fry chicken breast with olive oil until cooked.',
      'Chop romaine lettuce and place it in a bowl.',
      'Add croutons, grated Parmesan cheese, and sliced chicken.',
      'Drizzle Caesar dressing and toss to coat.',
      'Serve immediately.'
    ],
  ),
];
