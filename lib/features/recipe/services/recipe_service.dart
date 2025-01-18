import 'package:recipes/features/recipe/models/recipe.dart';
import 'package:recipes/features/recipe/repositories/mock_recipe_repository.dart';

class RecipeService {
  RecipeService(this.repository);
  final MockRecipeRepository repository;

  Future<void> addRecipe(Recipe recipe) async {
    if (recipe.name.isEmpty) {
      throw Exception('Recipe name cannot be empty.');
    } else {
      await repository.addRecipe(recipe);
    }
  }

  Future<List<Recipe>> getAllRecipes() async {
    return await repository.getAllRecipes();
  }

  Future<void> deleteRecipe(String id) async {
    await repository.deleteRecipe(id);
  }

  Future<void> updateRecipe(Recipe recipe) async {
    await repository.updateRecipe(recipe);
  }

  Future<Recipe> getRecipeById(String id) async {
    return await repository.getRecipeById(id);
  }
}
