// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screen/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  Widget buildListTile(String title, IconData icon, dynamic onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'ElMessiri', fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('الفلترة', Icons.filter_list, () {
            Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.screenRoute);
          }),
        ],
      ),
    );
  }
}
