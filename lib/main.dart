import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/di.dart';
import 'package:recipes/features/recipe/bloc/recipe_cubit.dart';
import 'package:recipes/routes.dart';
import 'package:recipes/themes/theme.dart';

void main() async => await init().then((_) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => locator<RecipeCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: Routes.router,
      ),
    );
  }
}
