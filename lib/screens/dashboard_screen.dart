import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa_app/screens/Timesheet/time_sheet_screen.dart';
import 'package:spa_app/screens/jobs/ui/job_list_screen.dart';
import 'package:spa_app/screens/setting/setting_screen.dart';
import 'notification/notification_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool selected = true;
  int _selectedIndex = 0;

  final screen = [
    JobListScreen(),
    TimeSheetScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: GoogleFonts.ubuntu(
            color: Colors.grey[400]),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work_outline_outlined,
            ),
            label: 'My Jobs',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined),
            label: 'Time Sheet',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0074f9),
        onTap: _onItemTapped,
      ),
    );

  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
