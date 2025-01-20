import 'package:recipes/features/recipe/models/recipe.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {
  RecipeInitial();
}

class RecipeLoading extends RecipeState {
  RecipeLoading();
}

class RecipeSuccess extends RecipeState {
  RecipeSuccess(this.recipes);

  final List<Recipe> recipes;
}

class RecipeError extends RecipeState {
  RecipeError(this.message);

  final String message;
}

class RecipeFailed extends RecipeState {
  RecipeFailed(this.message);

  final String message;
}
