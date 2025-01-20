import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/widgets/notched_nav_bar.dart';

class RootView extends StatelessWidget {
  const RootView({super.key, required this.statefulNavigationShell});
  final StatefulNavigationShell statefulNavigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statefulNavigationShell,
      extendBody: true,
      bottomNavigationBar: NotchedBottomNavBar(
        iconPaths: [
          CupertinoIcons.home,
          CupertinoIcons.search,
          CupertinoIcons.bell,
          CupertinoIcons.person,
        ],
        currentIndex: statefulNavigationShell.currentIndex,
        onIndexChange: statefulNavigationShell.goBranch,
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
