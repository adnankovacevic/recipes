import 'package:flutter/material.dart';
import 'package:recipes/views/add_recipe/add_recipe_view.dart';
import 'package:recipes/views/bookmarks/bookmarks_view.dart';
import 'package:recipes/views/home/home_view.dart';
import 'package:recipes/views/profile/profile_view.dart';
import 'package:recipes/views/search/search_view.dart';
import 'package:recipes/widgets/notched_bottom_nav.dart';

final List<Widget> views = [
  HomeView(),
  SearchView(),
  AddRecipeView(),
  BookmarksView(),
  ProfileView(),
];

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int currentIndex = 0;

  void onIndexChange(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: views[currentIndex],
      bottomNavigationBar: NotchedBottomNavBar(
        iconPaths: [
          Icons.home,
          Icons.search,
          Icons.bookmark,
          Icons.person,
        ],
        notchedIconPath: Icons.add,
        currentIndex: currentIndex,
        onIndexChange: onIndexChange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
