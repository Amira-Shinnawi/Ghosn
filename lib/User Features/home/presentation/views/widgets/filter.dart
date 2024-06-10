import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/data/plant_model.dart';
import 'package:ghosn_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Filter extends StatefulWidget {
  Filter({
    super.key,
    required this.category,
    required this.plants,
    required this.onCategorySelected,
    required this.onSoilTypeSelected,
    required this.onPriceSelected,
  });
  final List<Categories> category;
  final List<Plants> plants;

  final Function(String categoryName) onCategorySelected;
  final Function(String soilType) onSoilTypeSelected;
  final Function(String price) onPriceSelected;

  @override
  State<Filter> createState() => _filter();
}

class _filter extends State<Filter> {
  int _selectedCategoryName = 0;
  int _selectedSoilTypeName = 0;
  int _selectedPrice = 0;

  List soilType = ["LOAMY", "CLAYEY", "MOIST", "PEATY", "SANDY", "SILTY"];
  List price = ["ASC", "DESC"];

  Future<void> _loadSavedSelections() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedCategoryName = prefs.getInt(PREF_KEY_CATEGORY) ?? 0;
      _selectedPrice = prefs.getInt(PREF_KEY_PRICE) ?? 0;
      _selectedSoilTypeName = prefs.getInt(PREF_KEY_SOIL_TYPE) ?? 0;
    });
  }

  Future<void> _saveSelections() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(PREF_KEY_CATEGORY, _selectedCategoryName);
    await prefs.setInt(PREF_KEY_PRICE, _selectedPrice);
    await prefs.setInt(PREF_KEY_SOIL_TYPE, _selectedSoilTypeName);
  }

  @override
  void initState() {
    super.initState();
    _loadSavedSelections();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return DraggableScrollableSheet(
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 5, vertical: blockHeight * 2),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.filter_alt_outlined,
                    color: kGreenColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: blockWidth * 1,
                  ),
                  Text(
                    'Filter',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kGreenColor,
                        ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 20,
                      color: kGreenColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              Text(
                'Category',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Wrap(
                direction: Axis.horizontal,
                children: List.generate(widget.category.length, (index) {
                  Categories categories = widget.category[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryName = index;
                        widget.onCategorySelected(categories.name.toString());
                        _saveSelections();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 2,
                          vertical: blockHeight * 1),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedCategoryName == index
                                ? Colors.green
                                : Colors.grey,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 2,
                        ),
                        child: IntrinsicWidth(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                _selectedCategoryName == index
                                    ? const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: kGreenColor,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      )
                                    : const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          radius: 8,
                                        ),
                                      ),
                                SizedBox(width: blockWidth * 2),
                                Expanded(
                                  child: Text(
                                    categories.name.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Text(
                'Price',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Wrap(
                direction: Axis.horizontal,
                children: List.generate(price.length, (index) {
                  String priceName = price[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPrice = index;
                        widget.onPriceSelected(priceName);
                        _saveSelections();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 2,
                          vertical: blockHeight * 1),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedPrice == index
                                ? Colors.green
                                : Colors.grey,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 2,
                        ),
                        child: IntrinsicWidth(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                _selectedPrice == index
                                    ? const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: kGreenColor,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      )
                                    : const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          radius: 8,
                                        ),
                                      ),
                                SizedBox(width: blockWidth * 2),
                                Expanded(
                                  child: Text(
                                    priceName.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Divider(),
              Text(
                'Soil Type',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Wrap(
                direction: Axis.horizontal,
                children: List.generate(soilType.length, (index) {
                  String soilTypeName = soilType[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSoilTypeName = index;
                        widget.onSoilTypeSelected(soilTypeName);
                        _saveSelections();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 2,
                          vertical: blockHeight * 1),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedSoilTypeName == index
                                ? Colors.green
                                : Colors.grey,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 2,
                        ),
                        child: IntrinsicWidth(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                _selectedSoilTypeName == index
                                    ? const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: kGreenColor,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      )
                                    : const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          radius: 8,
                                        ),
                                      ),
                                SizedBox(width: blockWidth * 2),
                                Expanded(
                                  child: Text(
                                    soilTypeName.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
