import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/features/recipe/models/recipe.dart';
import 'package:recipes/themes/color_palettes.dart';
import 'package:recipes/features/recipe/widgets/info_row.dart';

class RecipeView extends HookWidget {
  const RecipeView({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final carouselController = useMemoized(() => CarouselController());
    final currentImage = useState(0);

    useEffect(() {
      return carouselController.dispose;
    }, [carouselController]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton.filled(
              color: Colors.white,
              onPressed: () {
                context.pop();
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
                    itemCount: recipe.images.length,
                    itemBuilder: (context, index, realIndex) =>
                        CachedNetworkImage(
                      imageUrl: recipe.images[index],
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeFactor: 0,
                      height: MediaQuery.of(context).size.height * 0.9,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        debugPrint('Page changed: $index');
                        currentImage.value = index;
                      },
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 0,
                    left: 0,
                    child: DotsIndicator(
                      dotsCount: recipe.images.length,
                      position: currentImage.value,
                      decorator: const DotsDecorator(
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
              preferredSize: const Size.fromHeight(50),
              child: Container(
                width: double.maxFinite,
                height: 40,
                decoration: const BoxDecoration(
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
                  children: [
                    Text(
                      recipe.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoRow(
                          text: "${recipe.duration} min",
                          icon: CupertinoIcons.timer,
                        ),
                        InfoRow(
                          text: "Medium",
                          icon: CupertinoIcons.chart_bar_square,
                        ),
                        InfoRow(
                          text: "${recipe.kcal} kcal",
                          icon: CupertinoIcons.flame,
                        ),
                      ],
                    ),
                    Text(
                      "Ingredients",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    // for (var ingredient in recipe.ingredients)
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
