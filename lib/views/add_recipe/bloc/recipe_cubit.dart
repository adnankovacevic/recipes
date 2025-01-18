import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/models/recipe.dart';

class RecipeCubit extends Cubit<List<Recipe>> {
  RecipeCubit() : super([]);

  void loadRecipes(List<Recipe> recipes) {
    emit(recipes);
  }

  void getRecipeByName(String name) {
    List<Recipe> recipes = state
        .where(
            (recipe) => recipe.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    emit(recipes);
  }

  void addRecipe(Recipe recipe) {
    state.add(recipe);
    emit(state);
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
