import 'package:flutter/material.dart';
import 'package:recipes/themes/color_palettes.dart';
import 'package:recipes/themes/text_theme_extensions.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top - 50),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: SearchBar(
                      textInputAction: TextInputAction.send,
                      shape: WidgetStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      side: const WidgetStatePropertyAll(BorderSide.none),
                      leading: Icon(
                        Icons.search,
                        color: ColorPalettes.backgroundShadow,
                      ),
                      hintText: "Search",
                      hintStyle: WidgetStatePropertyAll(
                          context.textTheme.titleSmall?.w400.transparent),
                      textStyle: WidgetStatePropertyAll(
                          context.textTheme.titleSmall?.w400),
                      backgroundColor: const WidgetStatePropertyAll(
                          ColorPalettes.background),
                      elevation: const WidgetStatePropertyAll(0),
                      constraints: BoxConstraints.tight(
                        const Size.fromHeight(kToolbarHeight - 10),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.tune),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
