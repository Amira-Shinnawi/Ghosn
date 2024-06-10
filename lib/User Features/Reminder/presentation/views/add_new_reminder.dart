import 'package:flutter/material.dart';

import 'package:ghosn_app/User%20Features/Reminder/presentation/views/widgets/add_new_reminder_body.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';


import '../../../../core/utils/style.dart';

class AddNewReminder extends StatefulWidget {
  const AddNewReminder({super.key});

  @override
  State<AddNewReminder> createState() => _AddNewReminderState();
}

class _AddNewReminderState extends State<AddNewReminder> {
 
  @override
  void initState() {
    super.initState();
     // Initialize _newEntryBlock here
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: CustomAppBar(
        titleAppBar: 
      Text(
            'New Alert ',
            style: Styles.textStyle20Inter.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          
           leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),

      ),
      body:
        
        AddNewReminderBody()
    );
  }
}