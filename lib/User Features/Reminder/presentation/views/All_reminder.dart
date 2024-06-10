import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/alert_type.dart';
import 'widgets/shared_prefrences.dart';

class AllReminder extends StatefulWidget {
  final List<Alert> alerts;
 final Function(Set<int>) onSelectionChanged;


  const AllReminder({
    super.key,
    required this.alerts,
      required this.onSelectionChanged,

  
  });

  @override
  State<AllReminder> createState() => _AllReminderState();
}

class _AllReminderState extends State<AllReminder> {
  TimeOfDay? _selectedTime;
  List<Alert> todayAlerts = [];
  Set<int> selectedIndexes = Set(); 
  @override
  void initState() {
    super.initState();
    loadAlerts();
  }

  List<Alert> getSelectedItems() {
    return selectedIndexes.map((index) => widget.alerts[index]).toList();
  }


  Future<void> loadAlerts() async {
    todayAlerts = await getAlerts();
    setState(() {}); // Update the UI
  }

  

  Future<void> loadTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? hour = prefs.getInt('selected_hour');
    int? minute = prefs.getInt('selected_minute');
    if (hour != null && minute != null) {
      setState(() {
        _selectedTime = TimeOfDay(hour: hour, minute: minute);
      });
    }
  }


  bool shouldShowAlert(Alert alert) {
    return alert.dateTime.hour == _selectedTime!.hour &&
        alert.dateTime.minute == _selectedTime!.minute;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

     if (widget.alerts.isEmpty) {
      return Center(
        child: Image.asset('assets/images/Time management-pana.png', ),  // Ensure the image path is correct
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
          top: height * 0.04, 
          left: width * 0.05, 
          right: width * 0.05),
      
    child:  GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio:
                1, // Ratio of the width to the height of each item
            crossAxisSpacing: 27, // Horizontal space between items
            mainAxisSpacing: 20, // Vertical space between items
          ),
          itemCount: widget.alerts.length,
          // itemCount: todayAlerts.length,
          itemBuilder: (context, index) {
           bool isSelected = selectedIndexes.contains(index);
            Alert alert = widget.alerts[index];
              return GestureDetector(
            onTap: () {
 setState(() {
              if (isSelected) {
                selectedIndexes.remove(index);
              } else {
                selectedIndexes.add(index);
              }
              widget.onSelectionChanged(selectedIndexes);
            });
          },
             child: Container(
              decoration: BoxDecoration(
                
                border: Border.all(color: isSelected ? Colors.red : kGreenColor, width: 1),
                borderRadius: BorderRadius.circular(30.0),
              ),
          
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                        width: width * .33,
                        height: height * .09,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          image: DecorationImage(
                            opacity: .8,
                            image: AssetImage(
                              alert.alertIcon,
                            ),
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: blockHeight * .18,
                  ),
                  Center(
                    child: Text(
                      alert.title, // Alert title
                      style: Styles.textStyle18Inter.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade900),
                    ),
                  ),
                  Center(
                    child: Text(
                      alert.alertType,
                      // Alert date

                      style: Styles.textStyle16Inter
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Text(
                      ' ${alert.dateTime.hour}:${alert.dateTime.minute}'
                      // Alert date
                      ,
                      style: Styles.textStyle16Inter
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              ),);
          })
      );
  };
  }
   // Function to get the selected items
}
  


