import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/purchases_model/purchases_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';

class PurchaseItem extends StatefulWidget {
  const PurchaseItem({super.key, required this.purchasesModel});
  final PurchasesModel purchasesModel;
  @override
  State<PurchaseItem> createState() => _PurchaseItemState();
}

class _PurchaseItemState extends State<PurchaseItem> {
  @override
  Widget build(BuildContext context) {
    // var now = DateTime.now();
    // var formatter = DateFormat.yMMMMd('en_US');
    // String formattedDate = formatter.format(now);

    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 2, vertical: blockHeight * 1),
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
              horizontal: blockWidth * 4, vertical: blockHeight * .5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 2 / 2,
                    child: Image(
                      image: NetworkHandler().getImage(
                          '${widget.purchasesModel.details!.imageUrl}'),
                      fit: BoxFit.cover,
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Plant: ',
                      style: Styles.textStyle16Inter.copyWith(
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '${widget.purchasesModel.details!.name}',
                          style: Styles.textStyle16Inter.copyWith(
                            fontSize: 14,
                            color: kGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Type: ',
                      style: Styles.textStyle16Inter.copyWith(
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '${widget.purchasesModel.productType}',
                          style: Styles.textStyle16Inter.copyWith(
                            fontSize: 14,
                            color: kGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Pot: ',
                      style: Styles.textStyle16Inter.copyWith(
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: widget.purchasesModel.details!.potVariations ==
                                  null
                              ? 'Not Chosen'
                              : '${widget.purchasesModel.details!.potVariations}',
                          style: Styles.textStyle16Inter.copyWith(
                            fontSize: 14,
                            color:
                                widget.purchasesModel.details!.potVariations ==
                                        null
                                    ? Colors.red
                                    : kGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Quantity: ',
                      style: Styles.textStyle16Inter.copyWith(
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '${widget.purchasesModel.quantity}',
                          style: Styles.textStyle16Inter.copyWith(
                            fontSize: 14,
                            color: kGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
