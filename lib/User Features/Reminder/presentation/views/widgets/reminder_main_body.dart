import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../model/alert_type.dart';
import '../All_reminder.dart';

class ReminderMainBody extends StatefulWidget {
  const ReminderMainBody({super.key});

  @override
  State<ReminderMainBody> createState() => _ReminderMainBodyState();
}

class _ReminderMainBodyState extends State<ReminderMainBody> {
  int _selectedTextIndex = 0;
  List<Alert> alerts = [];
  Set<int> selectedIndexes = Set();

  void deleteSelectedItems() async {
    setState(() {
      // Filter out the selected items.
      alerts = List<Alert>.from(alerts
          .where((item) => !selectedIndexes.contains(alerts.indexOf(item))));
      selectedIndexes.clear(); // Clear selection after deleting
    });

    // Update shared preferences after deleting
    final prefs = await SharedPreferences.getInstance();
    // Convert alerts to a list of strings
    List<String> encodedAlerts =
        alerts.map((alert) => json.encode(alert.toMap())).toList();
    await prefs.setStringList('alerts', encodedAlerts);
  }

//    void deleteSelectedItems() {
//   // Create a new list by including only items whose indices are not in selectedIndexes
//   setState(() {
//     alerts = List<Alert>.from(alerts.where((item) => !selectedIndexes.contains(alerts.indexOf(item))));
//     selectedIndexes.clear();  // Clear selection after deleting
//   });
// }

  List<String> reminderlist = [
    LocaleKeys.AllReminder.tr(),
  ];
  @override
  void initState() {
    super.initState();
    loadAlerts();
  }

  Future<void> loadAlerts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> alertsString = prefs.getStringList('alerts') ?? [];
    setState(() {
      alerts = alertsString
          .map((alertString) => Alert.fromMap(json.decode(alertString)))
          .toList();
    });
  }

  Widget _buildSelectedListView() {
    switch (_selectedTextIndex) {
      case 0:
        return AllReminder(
            alerts: alerts,
            onSelectionChanged: (Set<int> newSelection) {
              setState(() {
                selectedIndexes = newSelection;
              });
            });

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Column(
      children: [
        Container(
          color: kGreenColor,
          height: 130,

          // child: Column(
          //   children: [
          child: Padding(
            padding:
                EdgeInsets.only(top: blockHeight * 7, left: blockWidth * 6),
            child: SizedBox(
              height: blockHeight * 6,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: reminderlist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTextIndex = index;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * .1, vertical: 16),
                          child: Center(
                            child: Text(
                              reminderlist[index],
                              style: Styles.textStyle20Inter.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: blockWidth * 41,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 29,
                          ),
                          onPressed: () {
                            deleteSelectedItems();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: blockHeight * 55,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: reminderlist.length,
              onPageChanged: (index) {
                setState(() {
                  _selectedTextIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildSelectedListView();
              },
            ),
          ),
        ),
      ],
    );
  }
}
