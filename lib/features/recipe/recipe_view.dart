import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/features/recipe/models/recipe.dart';
import 'package:recipes/themes/color_palettes.dart';
import 'package:recipes/features/recipe/widgets/info_row.dart';

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({super.key, required this.recipe});
  final Recipe recipe;

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  final CarouselController carouselController = CarouselController();
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton.filled(
              color: Colors.white,
              onPressed: () {
                context.pop();
                // context.go(Routes.root);
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton.filled(
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.bookmark_border),
              ),
            ],
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: widget.recipe.images.length,
                    itemBuilder: (context, index, realIndex) =>
                        CachedNetworkImage(
                      imageUrl: widget.recipe.images[index],
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeFactor: 0,
                      height: MediaQuery.of(context).size.height * 0.9,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        debugPrint('Page changed: $index');
                        setState(() {
                          currentImage = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 0,
                    left: 0,
                    child: DotsIndicator(
                      dotsCount: widget.recipe.images.length,
                      position: currentImage,
                      decorator: DotsDecorator(
                        color: Colors.white,
                        activeColor: ColorPalettes.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
            floating: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                width: double.maxFinite,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      widget.recipe.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    // ListTile(
                    //   leading: ClipRRect(
                    //     borderRadius: BorderRadius.circular(30),
                    //     child: CachedNetworkImage(
                    //         imageUrl: 'https://i.pravatar.cc/150?img=52'),
                    //   ),
                    //   title: Text(
                    //     "By ${widget.recipe.author}",
                    //     style: context.textTheme.bodyMedium,
                    //   ),
                    //   subtitle: Text(
                    //     "Berlin, Germany",
                    //     style: context.textTheme.bodySmall?.transparent,
                    //   ),
                    //   trailing: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       const Icon(
                    //         CupertinoIcons.star_fill,
                    //         color: Colors.amber,
                    //       ),
                    //       const SizedBox(width: 4),
                    //       Text(
                    //         widget.recipe.rating.toString(),
                    //         style: Theme.of(context).textTheme.bodySmall,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoRow(
                          text: "${widget.recipe.duration} min",
                          icon: CupertinoIcons.timer,
                        ),
                        InfoRow(
                          text: "Medium",
                          icon: CupertinoIcons.chart_bar_square,
                        ),
                        InfoRow(
                          text: "${widget.recipe.kcal} kcal",
                          icon: CupertinoIcons.flame,
                        ),
                      ],
                    ),
                    Text(
                      "Ingredients",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    // for (var ingredient in widget.recipe.ingredients)
                    //   ListTile(
                    //     title: Text(
                    //       ingredient.name,
                    //       style: Theme.of(context).textTheme.bodySmall,
                    //     ),
                    //     trailing: Text(
                    //       "${ingredient.quantity} ${ingredient.unit.abbreviation}",
                    //       style: Theme.of(context).textTheme.bodySmall,
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
