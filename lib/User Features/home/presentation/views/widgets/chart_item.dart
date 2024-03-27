import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';

class ChartItem extends StatefulWidget {
  const ChartItem({
    super.key,
    required this.onChanged,
    this.value,
  });
  final void Function(bool?)? onChanged;
  final bool? value;

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
    int totalPrice = count * 150;

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
                  title: const Text(
                    'Sliver Plant',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    '${totalPrice} EGP ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  secondary: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AssetsData.imageTest3,
                      fit: BoxFit.cover,
                      width: blockWidth * 25,
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
                      const Text(
                        'Remove',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            count++;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '$count',
                        style: Styles.textStyle16Inter,
                      ),
                      IconButton(
                        onPressed: () {
                          if (count > 0) {
                            setState(() {
                              count--;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 25,
                          color: Colors.black,
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
