import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/cart_model/cart_model.dart';

class ChartItem extends StatefulWidget {
  const ChartItem({
    super.key,
    required this.onChanged,
    this.value,
    required this.cartModel,
    this.onTap,
  });
  final void Function(bool?)? onChanged;
  final bool? value;
  final CartItems cartModel;
  final void Function()? onTap;
  @override
  State<ChartItem> createState() => _ChartItemState();
}

class _ChartItemState extends State<ChartItem> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);

    return SizedBox(
      height: blockHeight * 16,
      width: blockWidth * 30,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: blockWidth * 1,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CheckboxListTile(
                  title: Text(widget.cartModel.name.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.cartModel.description}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: kGreyColor,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: blockHeight * .5,
                      ),
                      Text(
                        '${widget.cartModel.defaultPrice!.roundToDouble().toString()}.LE',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, color: kGreenColor),
                      ),
                    ],
                  ),
                  secondary: AspectRatio(
                    aspectRatio: 2 / 2,
                    child: Image(
                      image: NetworkHandler()
                          .getImage('${widget.cartModel.imageurl}'),
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                            'https://www.mashtalegypt.com/media/Classic-Terracotta-plant.png');
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  autofocus: false,
                  isThreeLine: false,
                  activeColor: kGreenColor,
                  checkColor: Colors.white,
                  selected: widget.value!,
                  value: widget.value,
                  onChanged: widget.onChanged,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          LocaleKeys.Remove.tr(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Q: ${widget.cartModel.quantity} ${LocaleKeys.Item.tr()}',
                        style: Styles.textStyle16Inter.copyWith(
                          color: kGreenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
