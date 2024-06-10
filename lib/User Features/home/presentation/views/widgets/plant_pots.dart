import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/data/pot_model.dart';
import 'package:ghosn_app/core/widgets/custom_network_image.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/graph_ql_config.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../pot_detail_home.dart';

class PlantPots extends StatefulWidget {
  const PlantPots({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  State<PlantPots> createState() => _PlantPotsState();
}

class _PlantPotsState extends State<PlantPots> {
  ValueNotifier<GraphQLClient> gClient = GraphQLConfigration();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return GraphQLProvider(
      client: gClient,
      child: Query(
          options: QueryOptions(
            document: gql(r"""
              query Pots($name: String) {
                  potProducts(where: { name: { contains: $name } }) {
                    colors
                    id
                    imageUrl
                    material
                    name
                    ReleventImgUrl
                    potVariations {
                      imageUrl
                      price
                      ReleventImgUrl
                      sizes
                      variationId
                    }
                  }
                }

      """),
            variables: {"name": widget.searchQuery},
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
            List<PotProducts>? potsProduct =
                PotModel.fromJson(result.data!).potProducts;

            return SizedBox(
              height: blockHeight * 35,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: potsProduct!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  PotProducts pots = potsProduct[index];
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
                                .getImage('${pots.releventImgUrl}'),
                            aspectRatio: 2 / 2,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PotDetailsHome(
                                    potModel: pots,
                                    gClient: gClient,
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
                                          text: "${pots.name!.split(' ')[1]}\n"
                                              .toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                        TextSpan(
                                          text:
                                              "${pots.material}".toUpperCase(),
                                          style: TextStyle(
                                            color: kGreenColor.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${pots.colors}',
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
          }),
    );
  }
}
