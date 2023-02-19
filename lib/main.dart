import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling_app/app_data.dart';
import './screen/filters_screen.dart';
import './screen/category_trips_screen.dart';
import './screen/tabs_screen.dart';

import '../screen/trip_details_screen.dart';
import 'models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _avaliableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaliableTrips = Trips_data.where((Trip) {
        if (_filters['summer'] == true && Trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && Trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && Trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((Trip) => Trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          Trips_data.firstWhere((Trip) => Trip.id == tripId),
        );
      });
    }
  }

  bool _isFavoratie(String id) {
    return _favoriteTrips.any((Trip) => Trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar', 'AE')],
      locale: const Locale('ar', 'AE'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.orange,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
                headline6: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
      //home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CategoryTripScreen.screenRoute: (ctx) =>
            CategoryTripScreen(_avaliableTrips),
        TripDetailsScreen.screenRoute: (ctx) =>
            TripDetailsScreen(_manageFavorite, _isFavoratie),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
