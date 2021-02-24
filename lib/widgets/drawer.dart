import 'package:flutter/material.dart';
import 'package:food_app/provider/darkmode.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  final bool flag = false;
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    DarkMode darkMode = Provider.of<DarkMode>(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("magic "),
            accountEmail: Text("magic88505@gmail.com"),
            currentAccountPicture: CircleAvatar(child: Text('M')),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
          ),
          ListTile(
            leading: Icon(Icons.pages_outlined),
            title: Text("Purchase History"),
          ),
          ListTile(
            leading: Icon(Icons.brightness_4_rounded),
            title: Text("Night Mode"),
            trailing: Switch(
              value: darkMode.flag,
              onChanged: (value) {
                darkMode.setFlag(value);
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.filter_vintage_sharp),
            title: Text("Setting"),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("App-version"),
          ),
          ListTile(
            leading: Icon(Icons.developer_mode_outlined),
            title: Text("Developer's"),
          ),
          ListTile(
            leading: Icon(Icons.star_border_sharp),
            title: Text("Rate this App"),
          ),
          ListTile(
            leading: Icon(Icons.flip_rounded),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
