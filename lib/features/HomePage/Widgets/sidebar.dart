import 'package:flutter/material.dart';
import 'package:horrorhub/features/HomePage/Settings/settings.dart';
import 'package:horrorhub/features/MyPoems/my_poems.dart';
import 'package:horrorhub/services/o_auth.dart';

class Sidebar extends StatelessWidget {
  final String uid;
  const Sidebar({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 154, 154, 154),
                  Color.fromARGB(255, 213, 197, 117),
                ],
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('My Poems'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyPoems(uid: uid)));
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => OauthService.logout(context),
          ),
        ],
      ),
    );
  }
}
