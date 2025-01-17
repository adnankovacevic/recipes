import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/views/notifications/notifications_view.dart';
import 'package:recipes/views/home/home_view.dart';
import 'package:recipes/views/account/account_view.dart';
import 'package:recipes/views/root/state/bottom_nav_cubit.dart';
import 'package:recipes/views/search/search_view.dart';
import 'package:recipes/widgets/notched_nav_bar.dart';

final List<Widget> views = [
  HomeView(),
  SearchView(),
  // AddRecipeView(),
  NotificationsView(),
  AccountView(),
];

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          final cubit = context.read<BottomNavCubit>();
          return Scaffold(
            extendBody: true,
            body: views[currentIndex],
            bottomNavigationBar: NotchedBottomNavBar(
              iconPaths: [
                CupertinoIcons.home,
                CupertinoIcons.search,
                CupertinoIcons.bell,
                CupertinoIcons.person,
              ],
              currentIndex: currentIndex,
              onIndexChange: cubit.changeIndex,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(),
              child: Icon(CupertinoIcons.add),
            ),
          );
        },
      ),
    );
  }
}
