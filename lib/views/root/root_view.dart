import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/views/bookmarks/bookmarks_view.dart';
import 'package:recipes/views/home/home_view.dart';
import 'package:recipes/views/account/account_view.dart';
import 'package:recipes/views/search/search_view.dart';
import 'package:recipes/widgets/notched_nav_bar.dart';

final List<Widget> views = [
  HomeView(),
  SearchView(),
  // AddRecipeView(),
  BookmarksView(),
  AccountView(),
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
          CupertinoIcons.home,
          CupertinoIcons.search,
          CupertinoIcons.bookmark,
          CupertinoIcons.person,
        ],
        currentIndex: currentIndex,
        onIndexChange: onIndexChange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
