import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:ghosn_app/User%20Features/Reminder/presentation/views/reminder_main.dart';

import 'package:ghosn_app/constants.dart';

import 'package:ghosn_app/core/utils/style.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../Service/local_notification_service.dart';
import '../../../model/alert_type.dart';
import 'shared_prefrences.dart';

class AddNewReminderBody extends StatefulWidget {
  const AddNewReminderBody({super.key});

  @override
  State<AddNewReminderBody> createState() => _AddNewReminderBodyState();
}

class _AddNewReminderBodyState extends State<AddNewReminderBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String _title = '';
  String _note = '';
  final DateTime _selectedDate = DateTime.now();
  // final TimeOfDay _selectedTime = TimeOfDay.now();
  String _alertType = 'daily'; // Default to 'daily'
  String _selectedIconPath =
      'assets/images/13e99ecb4e5c16b200ef962bed3805ff.jpg';
  TimeOfDay? _selectedTime;
  void updateTime(TimeOfDay time) {
    setState(() {
      _selectedTime = time;
      _timeController.text = _selectedTime!.format(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _timeController.text = _selectedTime!.format(context);
      }
    });
  }

  final List<String> _iconPaths = [
    'assets/images/68317a4257e1501ace3a7d9aaa21e78c.jpg',
    'assets/images/3377e49adaa92d8729f9520a8edaff7a.jpg',
    'assets/images/pruning-shears-concept-removing-excess-branches-plant-vector-color-icon-design-lawn-garden_135661-2694.jpg',
    'assets/images/6f6568479fc76169423758c228e3a27d.jpg',
  ];
  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Widget _buildIconChoices() {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 15,
      children: List.generate(_iconPaths.length, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              _selectedIconPath = _iconPaths[index];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _selectedIconPath == _iconPaths[index]
                    ? kGreenColor
                    : Colors.grey.shade600,
                width: _selectedIconPath == _iconPaths[index] ? 2 : 1,
              ),
              image: DecorationImage(
                image: AssetImage(_iconPaths[index]),
                fit: BoxFit.fill, 
              ),
            ),
          ),
        );
      }),
    );
  }

  // This method will be called when the user presses the save button
  Future<void> _saveAlert() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Combine the date and time into one DateTime object
      DateTime alertDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      // Create the Alert object
      Alert alert = Alert(
        title: _title,
        note: _note,
        dateTime: alertDateTime,
        alertType: _alertType,
        alertIcon: _selectedIconPath, 
      );

      
      await saveAlert(alert);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: blocWidth * 5,
            right: blocWidth * 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * .02),
              Row(
                children: [
                  Text(
                    'Title: ',
                    style: Styles.textStyle18Inter
                        .copyWith(color: Colors.grey[800]),
                  ),
                  SizedBox(width: width * .02),
                  Expanded(
                    child: CustomTextField(
                      borderRadius: 12, 
                      hintText: 'New Alert',
                      onChanged: (value) => setState(() => _title = value),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },

                      width: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                children: [
                  Text(
                    'Note: ',
                    style: Styles.textStyle18Inter
                        .copyWith(color: Colors.grey[800]),
                  ),
                  SizedBox(width: width * .02),
                  Expanded(
                    child: CustomTextField(
                      borderRadius: 12,
                      hintText: 'Enter note here',
                      minLength: 5,

                      width: 2,
                      onChanged: (value) => setState(() => _note = value),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                children: [
                  Text(
                    'Date: ',
                    style: Styles.textStyle18Inter
                        .copyWith(color: Colors.grey[800]),
                  ),
                  SizedBox(width: width * .02),
                  Expanded(
                    child: CustomTextField(
                      borderRadius: 12, 
                      hintText: '	DD/MM/YY',
                      readOnly: true,
                      showSuffixIcon: true,
                      suffixIcon: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.grey,
                      ),

                      onSuffixIconPressed: () =>
                          showDatePickerDialog(context, _dateController),

                      width: 2,
                      controller: _dateController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                children: [
                  Text(
                    'Time: ',
                    style: Styles.textStyle18Inter
                        .copyWith(color: Colors.grey[800]),
                  ),
                  SizedBox(width: width * .02),
                  Expanded(
                    child: CustomTextField(
                      borderRadius: 12, 
                      hintText: '	HH:MM',
                      width: 2,
                      controller: _timeController,
                      showSuffixIcon: true,
                      suffixIcon: const Icon(Icons.access_time_rounded,
                          color: Colors.grey),
                      onSuffixIconPressed: () => showTime(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              Text(
                "Alert Type",
                style:
                    Styles.textStyle18Inter.copyWith(color: Colors.grey[800]),
              ),
              SizedBox(height: height * .11, child: _buildIconChoices()),

              SizedBox(height: height * .02),
              Text(
                "Repeat alert message:",
                style:
                    Styles.textStyle18Inter.copyWith(color: Colors.grey[900]),
              ),
              SizedBox(height: height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: <Widget>[
                      Radio<String>(
                        activeColor: kGreenColor,
                        value: 'daily',
                        groupValue: _alertType,
                        onChanged: (value) {
                          setState(() {
                            _alertType = value!;
                          });
                        },
                      ),
                      Text(
                        'Daily',
                        style: Styles.textStyle16Inter
                            .copyWith(color: Colors.grey[900]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio<String>(
                        value: 'weekly',
                        activeColor: kGreenColor,
                        groupValue: _alertType,
                        onChanged: (value) {
                          setState(() {
                            _alertType = value!;
                          });
                        },
                      ),
                      Text(
                        'Weekly',
                        style: Styles.textStyle16Inter
                            .copyWith(color: Colors.grey[800]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio<String>(
                        value: 'monthly',
                        activeColor: kGreenColor,
                        groupValue: _alertType,
                        onChanged: (value) {
                          setState(() {
                            _alertType = value!;
                          });
                        },
                      ),
                      Text(
                        'Monthly',
                        style: Styles.textStyle16Inter
                            .copyWith(color: Colors.grey[900]),
                      ),
                    ],
                  ),
                ],
              ),

//
              SizedBox(height: height * .02),
              Center(
                child: CustomButton(
                    text: "Add",
                    width: 160,
                    height: 45,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await _saveAlert();

                          List<Alert> alerts = await getAlerts();

                          DateTime alertDateTime = DateTime(
                            _selectedDate.year,
                            _selectedDate.month,
                            _selectedDate.day,
                            _selectedTime!.hour,
                            _selectedTime!.minute,
                          );

                          Alert alert = Alert(
                            title: _title,
                            note: _note,
                            dateTime: alertDateTime,
                            alertType: _alertType,
                            alertIcon: _selectedIconPath,
                          );
                          await LocalNotificationService
                              .showScheduledNotification(alert);

                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.bottomSlide,
                            title: 'Success',
                            titleTextStyle: Styles.textStyle22Inter
                                .copyWith(color: Colors.black),
                            desc:
                                'Hooray! 🥳 Your new reminder has been planted in the garden of time 🌱',
                            descTextStyle: Styles.textStyle16Inter,
                            btnOkOnPress: () {
                           // Go back to ReminderMain and refresh
  

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ReminderMain(),
                                ),
                              );
                            },
                          ).show();
                          //
                        } catch (e) {
                          // Handle error
                          // You can show an error dialog or a toast message here
                          print("Error saving alert: $e");
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        error,
      ),
      backgroundColor: kGreenColor,
      duration: const Duration(milliseconds: 2000),
    ));
  }

  Future<void> showDatePickerDialog(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  Future<void> showTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        final localizations = MaterialLocalizations.of(context);
        _timeController.text = localizations.formatTimeOfDay(_selectedTime!,
            alwaysUse24HourFormat: false); // Update the controller
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('selected_hour', _selectedTime!.hour);
      await prefs.setInt('selected_minute', _selectedTime!.minute);
    }
  }
}
