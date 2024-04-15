import 'package:flutter/material.dart';

import '../../../data/categoryModel.dart';

class filter extends StatefulWidget {
  filter({super.key});

  @override
  State<filter> createState() =>_filter();
}

class _filter extends State<filter> {
  List<String> selectedcategory = [];
  void toggleCategory(String category) {
    setState(() {
      selectedcategory.contains(category)
          ? selectedcategory.remove(category)
          : selectedcategory.add(category);
      selectedcategory.contains(category)
          ? currentColor = Colors.grey
          : currentColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    RangeLabels Plabels =
    RangeLabels(Pvalues.start.toString(), Pvalues.end.toString());
    RangeLabels hlabels =
    RangeLabels(hvalues.start.toString(), hvalues.end.toString());
    RangeLabels tlabels =
    RangeLabels(tvalues.start.toString(), tvalues.end.toString());
    RangeLabels hightlabels =
    RangeLabels(hightvalues.start.toString(), hightvalues.end.toString());
    return DraggableScrollableSheet(
expand: false,
builder: (BuildContext context,
ScrollController scrollController) {
return Padding(
padding: const EdgeInsets.all(15.0),
child: ListView(shrinkWrap: true, children: [
Text(
'Category',
style: TextStyle(fontWeight: FontWeight.bold),
),
Divider(thickness: 1),
SizedBox(
height: 80,
width: double.infinity,
child: ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: categories.length,
itemBuilder:
(BuildContext context, int index) {
String category = categories[index].name;
return Padding(
padding: const EdgeInsets.all(8.0),
child: Container(
decoration: BoxDecoration(
color: Colors.white24,
boxShadow: [
BoxShadow(
blurRadius: 4,
color: Colors.black12,
offset: Offset(0, 4))
],
borderRadius:
BorderRadius.circular(10)),
width: 180,
child: Center(
child: CheckboxListTile(
activeColor: Colors.green,
title: Text(category),
value: selectedcategory
    .contains(category),
onChanged: (bool? value) {
toggleCategory(category);
},
controlAffinity:
ListTileControlAffinity
    .leading,
// Adjust the size of the checkbox container
contentPadding:
EdgeInsets.symmetric(
horizontal: 30.0,
vertical: 10.0),
),
),
),
);
},
),
),
Text(
'Price',
style: TextStyle(fontWeight: FontWeight.bold),
),
Divider(thickness: 1),
RangeSlider(
values: Pvalues,
onChanged: (newValues) {
setState(() {
Pvalues = newValues;
});
},
labels: Plabels,
activeColor: Colors.green,
divisions: 10,
max: 100,
min: 0,
),
Text(
'Discount',
style: TextStyle(fontWeight: FontWeight.bold),
),
Divider(thickness: 1),
Slider(
value: currentvalue,
onChanged: (newValue) {
setState(() {
currentvalue = newValue;
});
},
label: currentvalue.round().toString(),
activeColor: Colors.green,
divisions: 10,
max: 100,
min: 0,
),
Text(
'Humidity',
style: TextStyle(fontWeight: FontWeight.bold),
),
Divider(thickness: 1),
RangeSlider(
values: hvalues,
onChanged: (newValues) {
setState(() {
hvalues = newValues;
});
},
labels: hlabels,
activeColor: Colors.green,
divisions: 10,
max: 100,
min: 0,
),
Text(
'Tempreture',
style: TextStyle(fontWeight: FontWeight.bold),
),
Divider(thickness: 1),
RangeSlider(
values: tvalues,
onChanged: (newValues) {
setState(() {
tvalues = newValues;
});
},
labels: tlabels,
activeColor: Colors.green,
divisions: 10,
max: 100,
min: 0,
),
Text(
'Height',
style: TextStyle(fontWeight: FontWeight.bold),
),
Divider(thickness: 1),
RangeSlider(
values: hightvalues,
onChanged: (newValues) {
setState(() {
hightvalues = newValues;
});
},
labels: hightlabels,
activeColor: Colors.green,
divisions: 10,
max: 100,
min: 0,
),
]),
);
},
);}  RangeValues Pvalues = const RangeValues(20, 50);
  RangeValues hvalues = const RangeValues(20, 50);
  RangeValues tvalues = const RangeValues(20, 50);
  RangeValues hightvalues = const RangeValues(20, 50);
  double currentvalue = 20;
  Color currentColor = Colors.grey;}