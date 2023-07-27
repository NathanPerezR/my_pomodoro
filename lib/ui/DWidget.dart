import 'package:flutter/material.dart';
import 'package:my_pomodoro/pages/Settings.dart';
import '../pages/Chart.dart';
import 'Themes.dart';

//returns Drawer to be used for Navigation in Home.dart
class DWidget extends StatelessWidget implements PreferredSizeWidget {
  const DWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 64.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: CommonThemes().defaultTheme.colorScheme.background,
              ),
              child: const Text('My Pomodoro'),
            ),
          ),
          ListTile(
            title: const Text('Charts'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chart()),
              );
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
