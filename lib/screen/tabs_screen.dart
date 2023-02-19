import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/app_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrip;

  TabsScreen(this.favoriteTrip);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // ignore: prefer_final_fields

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, dynamic>> _screen;
  @override
  void initState() {
    _screen = [
      {
        'Screen': CategoriesScreen(),
        'Title': 'تصنيفات الرحلة',
      },
      {
        'Screen': FavoriteScreen(widget.favoriteTrip),
        'Title': 'الرحلات المفضلة',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_screen[_selectedScreenIndex]['Title'])),
      ),
      drawer: AppDrawer(),
      body: _screen[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
