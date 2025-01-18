import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/features/recipe/bloc/recipe_cubit.dart';
import 'package:recipes/features/recipe/services/recipe_service.dart';

final GetIt di = GetIt.instance;

Future<void> init() async {
  // ensure Flutter initialized
  WidgetsFlutterBinding.ensureInitialized();

  // cubits
  di.registerFactory(() => RecipeCubit());

  // services
  di.registerLazySingleton(() => RecipeService(di()));
}
