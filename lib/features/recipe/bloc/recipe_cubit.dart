import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/di.dart';
import 'package:recipes/features/recipe/models/recipe.dart';
import 'package:recipes/features/recipe/services/recipe_service.dart';

class RecipeCubit extends Cubit<List<Recipe>> {
  RecipeCubit() : super([]);

  void loadRecipes(List<Recipe> recipes) async {
    final recipes = await di.get<RecipeService>().getAllRecipes();
    emit(recipes);
  }

  void getRecipeByName(String name) {
    List<Recipe> recipes = state
        .where(
            (recipe) => recipe.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    emit(recipes);
  }

  void addRecipe(Recipe recipe) async {
    await di.get<RecipeService>().addRecipe(recipe);
    emit([...state, recipe]);
  }

  void updateRecipe(Recipe recipe) {
    int index = state.indexOf(recipe);
    state[index] = recipe;
    emit(state);
  }

  void removeRecipe(Recipe recipe) {
    state.remove(recipe);
    emit(state);
  }
}
