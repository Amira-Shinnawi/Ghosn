import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/data/plant_model.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/product_details_home.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/graph_ql_config.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import 'filter.dart';
import 'title_with_more_button.dart';

class PopularPlants extends StatefulWidget {
  PopularPlants({
    super.key,
    required this.searchQuery,
    this.categories,
    this.plants,
  });
  final String searchQuery;
  List<Categories>? categories;
  List<Plants>? plants;
  @override
  State<PopularPlants> createState() => _PopularPlantsState();
}

class _PopularPlantsState extends State<PopularPlants> {
  String filterCategoryName = '';

  String filterPrice = "ASC";

  String filterSoilType = "LOAMY";

  ValueNotifier<GraphQLClient> gClient = GraphQLConfigration();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Column(
      children: [
        TitleWithMoreButton(
            title: "Popular Plant",
            morePressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Filter(
                    category: widget.categories!,
                    plants: widget.plants!,
                    onPriceSelected: (price) {
                      setState(() {
                        filterPrice = price;
                        print(filterPrice);
                      });
                    },
                    onCategorySelected: (categoryName) {
                      setState(() {
                        filterCategoryName = categoryName;
                        print(filterCategoryName);
                      });
                    },
                    onSoilTypeSelected: (soilType) {
                      setState(() {
                        filterSoilType = soilType;
                        print(filterSoilType);
                      });
                    },
                  );
                },
              );
            }),
        SizedBox(
          height: blockHeight * 2,
        ),
        GraphQLProvider(
          client: gClient,
          child: Query(
            options: QueryOptions(
              document: gql(r"""
            query GetPlant($contains: String, $defaultPrice: SortEnumType, $categoryName: String, $eq: SoilType) {
              plants(
                order: { defaultPrice: $defaultPrice }
                where: {
                  name: { contains: $contains }
                  category: { name: { contains: $categoryName } }
                  soilType: { eq: $eq }
                }
              ) {
                id
                name
                description
                soilType
                defaultPrice
                amountOfWater
                amountSunlight
                minTemperature
                maxTemperature
                humdity
                height
                imageUrl
                ReleventImgUrl
                quantity
                category {
                  description
                  id
                  name
                  products {
                    description
                    id
                    imageUrl
                    name
                  }
                }
                userReviews {
                  comment
                  dateAdded
                  rating
                }
              }
              categories {
                description
                name
                id
              }
            }
      """),
              variables: {
                "defaultPrice": filterPrice,
                "contains": widget.searchQuery,
                "categoryName": filterCategoryName,
                "eq": filterSoilType
              },
            ),
            builder: (result, {fetchMore, refetch}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }
              if (result.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<Plants>? plant = PlantModel.fromJson(result.data!).plants;

              List<Categories>? categories =
                  PlantModel.fromJson(result.data!).categories;

              widget.plants = plant;
              widget.categories = categories;
              return SizedBox(
                height: blockHeight * 35,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: plant!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Plants plants = plant[index];
                    return Container(
                      margin: EdgeInsets.only(
                        left: blockWidth * 5,
                        top: blockHeight * 2,
                        bottom: blockHeight * 2,
                      ),
                      width: blockWidth * 45,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomNetworkImage(
                              imageUrl: NetworkHandler()
                                  .getImage('${plants.releventImgUrl}'),
                              aspectRatio: 2 / 2,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsHome(
                                      gClient: gClient,
                                      plantModel: plants,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: blockWidth * 2,
                                    vertical: blockHeight * 1),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 10),
                                      blurRadius: 50,
                                      color: kGreenColor.withOpacity(0.23),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "${plants.name!.split(' ').first}\n"
                                                    .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          TextSpan(
                                            text: "${plants.category!.name}"
                                                .toUpperCase(),
                                            style: TextStyle(
                                              color:
                                                  kGreenColor.withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '${plants.defaultPrice!.roundToDouble()}.LE',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(color: kGreenColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
