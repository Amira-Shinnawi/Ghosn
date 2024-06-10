import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/repo/cart_repo_impl.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/manager/cubit/cart_cubit.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';
import 'package:ghosn_app/core/utils/service_locator.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: blockWidth * 2),
      child: SizedBox(
        height: blockHeight * 25,
        width: double.infinity,
        child: BlocProvider(
          create: (context) =>
              CartCubit(getIt.get<CartRepoImpl>())..fetchBestSeller(),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is BestSellerSuccess) {
                return ListView.builder(
                  itemCount: state.bestSeller.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                backgroundColor: Colors.white,
                                elevation: 0.0,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image(
                                      image: NetworkHandler().getImage(
                                        'Plant_Images/${state.bestSeller[index].imageUrl!}',
                                      ),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    height: blockHeight * 1,
                                  ),
                                  Center(
                                    child: Text(
                                      '${state.bestSeller[index].name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: kGreenColor,
                                          ),
                                    ),
                                  ),
                                  const Divider(),
                                  Center(
                                    child: Text(
                                      '${state.bestSeller[index].description}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: kGreenColor,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: blockWidth * 4,
                          top: blockHeight * 2,
                          bottom: blockHeight * 3,
                        ),
                        width: blockWidth * 60,
                        height: blockHeight * 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: kGreenColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: blockHeight * 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                state.bestSeller[index].name!.toUpperCase(),
                                style: TextStyle(
                                  color: kGreenColor.withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: blockHeight * 1,
                              ),
                              CustomNetworkImage(
                                imageUrl: NetworkHandler()
                                    .getImage(
                                        'Plant_Images/${state.bestSeller[index].imageUrl!}')
                                    ,
                                aspectRatio: 2 / 1,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is BestSellerFailure) {
                return Center(
                  child: Text(
                    'No Item In Your Best Seller',
                    style: Styles.textStyle16Inter.copyWith(
                      color: kGreenColor,
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
