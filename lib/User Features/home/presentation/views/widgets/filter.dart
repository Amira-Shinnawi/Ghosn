import 'package:flutter/material.dart';

import '../../../data/categoryModel.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _filter();
}

class _filter extends State<Filter> {
  List<String> selectedCategory = [];
  void toggleCategory(String category) {
    setState(() {
      selectedCategory.contains(category)
          ? selectedCategory.remove(category)
          : selectedCategory.add(category);
      selectedCategory.contains(category)
          ? currentColor = Colors.grey
          : currentColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    RangeLabels pLabels =
        RangeLabels(pValues.start.toString(), pValues.end.toString());
    RangeLabels hLabels =
        RangeLabels(hValues.start.toString(), hValues.end.toString());
    RangeLabels tLabels =
        RangeLabels(tValues.start.toString(), tValues.end.toString());
    RangeLabels hightLabels =
        RangeLabels(hightValues.start.toString(), hightValues.end.toString());
    return DraggableScrollableSheet(
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(shrinkWrap: true, children: [
            const Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1),
            SizedBox(
              height: blockHeight * 10,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  String category = categories[index].name;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockWidth * 2, vertical: blockHeight * 1),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black12,
                                offset: Offset(0, 4))
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      width: 180,
                      child: Center(
                        child: CheckboxListTile(
                          activeColor: Colors.green,
                          title: Text(category),
                          value: selectedCategory.contains(category),
                          onChanged: (bool? value) {
                            toggleCategory(category);
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 2,
                              vertical: blockHeight * 1),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text(
              'Price',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1),
            RangeSlider(
              values: pValues,
              onChanged: (newValues) {
                setState(() {
                  pValues = newValues;
                });
              },
              labels: pLabels,
              activeColor: Colors.green,
              divisions: 10,
              max: 100,
              min: 0,
            ),
            const Text(
              'Discount',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1),
            Slider(
              value: currentValue,
              onChanged: (newValue) {
                setState(() {
                  currentValue = newValue;
                });
              },
              label: currentValue.round().toString(),
              activeColor: Colors.green,
              divisions: 10,
              max: 100,
              min: 0,
            ),
            const Text(
              'Humidity',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1),
            RangeSlider(
              values: hValues,
              onChanged: (newValues) {
                setState(() {
                  hValues = newValues;
                });
              },
              labels: hLabels,
              activeColor: Colors.green,
              divisions: 10,
              max: 100,
              min: 0,
            ),
            const Text(
              'Tempreture',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1),
            RangeSlider(
              values: tValues,
              onChanged: (newValues) {
                setState(() {
                  tValues = newValues;
                });
              },
              labels: tLabels,
              activeColor: Colors.green,
              divisions: 10,
              max: 100,
              min: 0,
            ),
            const Text(
              'Height',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1),
            RangeSlider(
              values: hightValues,
              onChanged: (newValues) {
                setState(() {
                  hightValues = newValues;
                });
              },
              labels: hightLabels,
              activeColor: Colors.green,
              divisions: 10,
              max: 100,
              min: 0,
            ),
          ]),
        );
      },
    );
  }

  RangeValues pValues = const RangeValues(20, 50);
  RangeValues hValues = const RangeValues(20, 50);
  RangeValues tValues = const RangeValues(20, 50);
  RangeValues hightValues = const RangeValues(20, 50);
  double currentValue = 20;
  Color currentColor = Colors.grey;
}
