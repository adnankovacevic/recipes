import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/di.dart';
import 'package:recipes/features/recipe/bloc/recipe_state.dart';
import 'package:recipes/features/recipe/models/recipe.dart';
import 'package:recipes/features/recipe/repositories/mock_recipe_repository.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeLoading());

  MockRecipeRepository get mockRecipeRepository =>
      locator.get<MockRecipeRepository>();
  Future<void> loadRecipes() async {
    emit(RecipeLoading());
    try {
      debugPrint('Fetching recipes...');
      final recipes = await mockRecipeRepository.getAllRecipes();
      debugPrint('Recipes loaded: ${recipes.length}');
      emit(RecipeSuccess(recipes));
    } catch (e) {
      debugPrint('Error loading recipes: $e');
      emit(RecipeError('Failed to load recipes: $e'));
    }
  }

  void getRecipeByName(String name) {
    if (state is RecipeSuccess) {
      final allRecipes = (state as RecipeSuccess).recipes;
      emit(RecipeLoading());
      try {
        final searchResults = allRecipes
            .where((recipe) =>
                recipe.name.toLowerCase().contains(name.toLowerCase()))
            .toList();
        emit(RecipeSuccess(searchResults));
      } catch (e) {
        emit(RecipeError('Search failed: $e'));
      }
    }
  }

  Future<void> addRecipe(Recipe recipe) async {
    if (state is RecipeSuccess) {
      emit(RecipeLoading());
      try {
        await mockRecipeRepository.addRecipe(recipe);
        final updatedRecipes =
            List<Recipe>.from((state as RecipeSuccess).recipes)..add(recipe);
        emit(RecipeSuccess(updatedRecipes));
      } catch (e) {
        emit(RecipeError('Failed to add recipe: $e'));
      }
    }
  }

  Future<void> updateRecipe(Recipe updatedRecipe) async {
    if (state is RecipeSuccess) {
      emit(RecipeLoading());
      try {
        final recipes = List<Recipe>.from((state as RecipeSuccess).recipes);
        final index =
            recipes.indexWhere((recipe) => recipe.id == updatedRecipe.id);

        if (index != -1) {
          recipes[index] = updatedRecipe;
          await mockRecipeRepository.updateRecipe(updatedRecipe);
          emit(RecipeSuccess(recipes));
        }
      } catch (e) {
        emit(RecipeError('Failed to update recipe: $e'));
      }
    }
  }

  Future<void> removeRecipe(Recipe recipe) async {
    if (state is RecipeSuccess) {
      emit(RecipeLoading());
      try {
        await mockRecipeRepository.deleteRecipe(recipe.id);
        final updatedRecipes =
            List<Recipe>.from((state as RecipeSuccess).recipes)
              ..removeWhere((r) => r.id == recipe.id);
        emit(RecipeSuccess(updatedRecipes));
      } catch (e) {
        emit(RecipeError('Failed to remove recipe: $e'));
      }
    }
  }
}
