part of 'pages.dart';


class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        Column(
          children: [
            //// HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MBPFAST Market',
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Distributor Fastener Terbaik Di Batam",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: new AssetImage('assets/icon_profile.png'),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            //// LIST OF BANNER
            Container(
              height: 180,
              width: double.infinity,
              child: BlocBuilder<BannerCubit, BannerState>(
                builder: (_, state) => (state is BannerLoaded)
                    ? CarouselSlider(
                        items: state.banners
                        .map((item) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                  child:
                                      Image.network('https://market.mbpfast.com/storage/'+item.photos, fit: BoxFit.cover, width: 1000)),
                            ))
                        .toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                        ),
                      )
                    : Center(child: loadingIndicator),
              ),
            ),

            Container(
              height: 24,
              padding: EdgeInsets.only(left: 24),
              width: double.infinity,
              child: Text('Categories',
                  style: blackFontStyle2,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
              ),
            ),

            //// LIST OF BANNER (TABS)
            //// LIST OF FOOD
            Container(
              height: 200,
              width: double.infinity,
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (_, state) => (state is CategoryLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.categories
                                .map((kategori) => Padding(
                                      padding: EdgeInsets.only(
                                          left: (e == state.categories.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin),
                                      child: GestureDetector(
                                          onTap: () {
                                            
                                          },
                                          child: CategoryCard(kategori)),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    : Center(child: loadingIndicator),
              ),
            ),

            Container(
              height: 24,
              padding: EdgeInsets.only(left: 24),
              width: double.infinity,
              child: Text('New Products',
                  style: blackFontStyle2,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
              ),
            ),

            //// LIST OF BANNER (TABS)
            //// LIST OF FOOD
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) => (state is FoodLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.foods
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: (e == state.foods.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(FoodDetailsPage(
                                              transaction: Transaction(
                                                  food: e,
                                                  user: (context
                                                          .bloc<UserCubit>()
                                                          .state as UserLoaded)
                                                      .user),
                                              onBackButtonPressed: () {
                                                Get.back();
                                              },
                                            ));
                                          },
                                          child: FoodCard(e)),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    : Center(child: loadingIndicator),
              ),
            ),
            //// LIST OF FOOD (TABS)
            // Container(
            //   width: double.infinity,
            //   color: Colors.white,
            //   child: Column(
            //     children: [
            //       CustomTabBar(
            //         titles: ['New Taste', 'Popular', 'Recommended'],
            //         selectedIndex: selectedIndex,
            //         onTap: (index) {
            //           setState(() {
            //             selectedIndex = index;
            //           });
            //         },
            //       ),
            //       SizedBox(
            //         height: 16,
            //       ),
            //       BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
            //         if (state is FoodLoaded) {
            //           List<Food> foods = state.foods
            //               .where((element) => element.types.contains(
            //                   (selectedIndex == 0)
            //                       ? FoodType.new_food
            //                       : (selectedIndex == 1)
            //                           ? FoodType.popular
            //                           : FoodType.recommended))
            //               .toList();
            //
            //           return Column(
            //             children: foods
            //                 .map((e) => Padding(
            //                       padding: EdgeInsets.fromLTRB(
            //                           defaultMargin, 0, defaultMargin, 16),
            //                       child: FoodListItem(
            //                           food: e, itemWidth: listItemWidth),
            //                     ))
            //                 .toList(),
            //           );
            //         } else {
            //           return Center(
            //             child: loadingIndicator,
            //           );
            //         }
            //       }),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 80,
            // )
          ],
        )
      ],
    );
  }
}
