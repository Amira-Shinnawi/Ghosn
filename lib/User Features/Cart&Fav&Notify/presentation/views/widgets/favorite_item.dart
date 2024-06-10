import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';

import '../../../data/model/fav_model/fav_model.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({super.key, required this.favModel, this.onTap});
  final FavModel favModel;
  final void Function()? onTap;
  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 1),
      child: Container(
        height: blockHeight * 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kHintColor.withOpacity(.2),
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 3, vertical: blockHeight * 1),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2 / 2,
                child: Image(
                  image: NetworkHandler()
                      .getImage('Plant_Images/${widget.favModel.imageUrl}'),
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                        'https://www.mashtalegypt.com/media/Classic-Terracotta-plant.png');
                  },
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: blockWidth * 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${widget.favModel.name}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Type: ${widget.favModel.categoryName}',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kGreenColor,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Icon(
                        FontAwesomeIcons.heartCircleMinus,
                        color: kGreenColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
