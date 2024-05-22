import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Reminder/presentation/views/add_new_reminder.dart';
import 'package:ghosn_app/User%20Features/Reminder/presentation/views/widgets/reminder_main_body.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../Account/presentation/views/widgets/user_custom_drawer.dart';

class ReminderMain extends StatefulWidget {
  const ReminderMain({super.key});

  @override
  State<ReminderMain> createState() => _ReminderMainState();
}

class _ReminderMainState extends State<ReminderMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(
      backgroundColor: kGreenColor,
      elevation:0,
     
   
          titleAppBar: Text(
            'Reminder Me',
            style: Styles.textStyle20Inter.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          automaticallyImplyLeading: false,
          centerTitle: false, leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
          ),
        
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kNotification);
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 25,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                FontAwesomeIcons.bars,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
    ),

      
  
    drawer: const UserCustomDrawer(),
    key: _scaffoldKey,
     body: Stack(
      children: [
        const ReminderMainBody(),
        Positioned(
          bottom: 20,
          right: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30), 
            child: FloatingActionButton(
              backgroundColor: kGreenColor,
              onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddNewReminder()
                ));
                
              },
              child: const Icon(
                Icons.add_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}

