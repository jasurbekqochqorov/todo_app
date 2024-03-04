import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework12/screens/tab/profile/profile_screen.dart';
import 'package:homework12/utils/color/color.dart';
import '../../data/models/local/local_database.dart';
import '../../data/models/task/task_models.dart';
import 'calendar/calendar_screen.dart';
import 'home/diologs/add_task_diolog.dart';
import 'home/home_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  StreamController<bool> streamController=StreamController<bool>();
  List<Widget> screens = [const HomeScreen(), const CalendarScreen(),const ProfileScreen()];

  int activeIndex = 0;

  _init() async{
    screens = [HomeScreen(
      stream: streamController.stream.asBroadcastStream(),
    ), const CalendarScreen(),const ProfileScreen()];
    setState(() {});
  }
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: AppColors.black,
        currentIndex: activeIndex,
         backgroundColor: AppColors.c_363636,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withOpacity(0.3),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size:30,),
            label: "Index",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month,size:30,),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size:30,),
            label: "Profile",
          )
        ],
      ),
        floatingActionButton:FloatingActionButton(
          backgroundColor: AppColors.blue,
          onPressed: () {
            addTaskDialog(context: context,
                taskModelChanged:(task) async {
                  await LocalDatabase.insertTask(task);
                  streamController.add(true);
            });
          },
          child:const Icon(Icons.add,color: AppColors.white,),
        )
    );
  }
}
