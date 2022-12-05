
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '/mylibs.dart';
import 'dart:math' as math;

class Products extends StatelessWidget {
  Products({super.key});
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
        child: SafeArea(
          child: CustomScrollView(
            controller: scrollController
              ..addListener(() {
                if (scrollController.position.maxScrollExtent ==
                    scrollController.offset) {
                  context.read<ProductsProvider>().getInfiniteProducts(
                      parentId:
                          "${context.read<SelectedCategoryProvider>().selectedCat ?? 0}",
                      categoryId:
                          "${context.read<SelectedSubCategoryProvider>().selectedSubCat ?? 0}");
                }
              }),
            shrinkWrap: true,
            slivers: [
              const SliverAppBar(
                elevation: 0,
                scrolledUnderElevation: 1,
                title: Text('Farawlah'),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: StickyHeaderDelegate(
                      minHeight: 100,
                      maxHeight: double.minPositive,
                      child: Container(
                        padding: const EdgeInsets.only(top: 16),
                        color: Colors.white,
                        child: Column(
                          children: const [
                            CategoryListSection(),
                            SizedBox(height: 15),
                            SubCategoryListSection(),
                          ],
                        ),
                      ))),
              Consumer<ProductsProvider>(builder: (context, state, _) {
                if (state.loading == true) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(childCount: 4,
                          (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ));
                  }));
                }
                if (state.isSuccess == true) {
                  if (state.productsListModel.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Column(
                          children: [
                            Lottie.asset('assets/shopping-bag.json',
                                repeat: false),
                            const Text('Nothing..!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
                    );
                  }
                  return ProductsListSection(
                    state: state,
                  );
                }
                return const SliverFillRemaining();
              })
            ],
          ),
        ),
      ),
    );
  }
}

/*
<<------------------------- Products Listing Section --------------------->>
*/

class ProductsListSection extends StatelessWidget {
  const ProductsListSection({Key? key, required this.state}) : super(key: key);
  final ProductsProvider state;
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: state.productsListModel.length + 1, (context, index) {
      if (index < state.productsListModel.length) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/logo.webp'))),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.productsListModel[index].name}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .fontSize! -
                                    5),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            '${state.productsListModel[index].price?.salePrice} SAR',
                            style: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.favorite_border,
                            color: Colors.green.shade600),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: Colors.green.shade600),
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state.hasMore == true
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.green.shade400,
                    ),
                  )
                : Container(),
          ],
        );
      }
    }));
  }
}

/*
<<------------------------- Sub Categories Listing Section --------------------->>
*/
class SubCategoryListSection extends StatelessWidget {
  const SubCategoryListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 10),
          child: Icon(
            Icons.filter_alt,
            color: Colors.black87,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child:
                Consumer<SubCategoriesProvider>(builder: (context, scvalue, _) {
              if (scvalue.loading == true) {
                return Row(
                  children: List.generate(
                      10,
                      (index) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 13),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                          ))),
                );
              }
              if (scvalue.isSuccess == true) {
                return Row(
                  children: List.generate(
                      scvalue.subCategoriesModel.length,
                      (index) => Consumer<SelectedSubCategoryProvider>(
                              builder: (context, select, _) {
                            return InkWell(
                              onTap: () {
                                context
                                        .read<SelectedSubCategoryProvider>()
                                        .changeSubCatId =
                                    scvalue.subCategoriesModel[index].id!;
                                context.read<ProductsProvider>().getAllProducts(
                                    offset: '0',
                                    parentId:
                                        "${context.read<SelectedCategoryProvider>().selectedCat ?? 0}",
                                    categoryId:
                                        '${select.selectedSubCat ?? 0}');
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: index != 0 ? 10 : 10,
                                    left: index == 0 ? 10 : 0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                    color: select.selectedSubCat == null &&
                                            index == 0
                                        ? Colors.green.shade400
                                        : select.selectedSubCat ==
                                                scvalue
                                                    .subCategoriesModel[index]
                                                    .id
                                            ? Colors.green.shade400
                                            : null,
                                    border: Border.all(
                                      color: Colors.green.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "${scvalue.subCategoriesModel[index].name}",
                                  style: TextStyle(
                                      color: select.selectedSubCat == null &&
                                              index == 0
                                          ? Colors.white
                                          : select.selectedSubCat ==
                                                  scvalue
                                                      .subCategoriesModel[index]
                                                      .id
                                              ? Colors.white
                                              : null),
                                ),
                              ),
                            );
                          })),
                );
              }
              return Container();
            }),
          ),
        ),
      ],
    );
  }
}

/*
<<------------------------- Categories Listing Section --------------------->>
*/
class CategoryListSection extends StatelessWidget {
  const CategoryListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 10),
          child: Icon(
            CupertinoIcons.square_grid_2x2,
            color: Colors.black87,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child:
                Consumer<CategoriesProvider>(builder: (context, state, child) {
              if (state.loading == true) {
                return Row(
                  children: List.generate(
                      10,
                      (index) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 13),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                          ))),
                );
              }
              if (state.isSuccess == true) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  context.read<SubCategoriesProvider>().getAllSubCategories(
                      parentId:
                          "${context.read<SelectedCategoryProvider>().selectedCat ?? state.categoriesModel[0].id}");
                  context
                      .read<ProductsProvider>()
                      .getAllProducts(parentId: '0', categoryId: '0');
                });
                return Row(
                  children: List.generate(
                      state.categoriesModel.length,
                      (index) => InkWell(
                            onTap: () {
                              context
                                      .read<SelectedCategoryProvider>()
                                      .changeCatId =
                                  state.categoriesModel[index].id!;
                              context
                                  .read<SelectedSubCategoryProvider>()
                                  .changeSubCatId = null;
                              context
                                  .read<SubCategoriesProvider>()
                                  .getAllSubCategories(
                                      parentId:
                                          "${state.categoriesModel[index].id}");
                              context.read<ProductsProvider>().getAllProducts(
                                  offset: '0',
                                  parentId:
                                      "${context.read<SelectedCategoryProvider>().selectedCat ?? 0}",
                                  categoryId: '0');
                            },
                            child: Consumer<SelectedCategoryProvider>(
                                builder: (context, select, _) {
                              return Container(
                                margin: EdgeInsets.only(
                                    right: index != 0 ? 10 : 10,
                                    left: index == 0 ? 10 : 0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                    color: select.selectedCat == null &&
                                            index == 0
                                        ? Colors.green.shade400
                                        : select.selectedCat ==
                                                state.categoriesModel[index].id
                                            ? Colors.green.shade400
                                            : null,
                                    border: Border.all(
                                      color: Colors.green.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "${state.categoriesModel[index].name}",
                                  style: TextStyle(
                                      color: select.selectedCat == null &&
                                              index == 0
                                          ? Colors.white
                                          : select.selectedCat ==
                                                  state
                                                      .categoriesModel[index].id
                                              ? Colors.white
                                              : null),
                                ),
                              );
                            }),
                          )),
                );
              }
              return Container();
            }),
          ),
        ),
      ],
    );
  }
}

/*
<<------------------------- Sliver Persistent Header Delegate Widget --------------------->>
*/

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(StickyHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}
