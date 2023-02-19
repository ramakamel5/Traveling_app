import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripScreen extends StatefulWidget {
  static const screenRoute = '/category-trip';
  final List<Trip> availableTrip;
  CategoryTripScreen(this.availableTrip);

  @override
  State<CategoryTripScreen> createState() => _CategoryTripScreenState();
}

class _CategoryTripScreenState extends State<CategoryTripScreen> {
  late String categoryTitle;

  late List<Trip> displayTrips;

  @override
  void didChangeDependencies() {
    final routArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routArgument['id'];
    categoryTitle = routArgument['title']!;
    displayTrips = widget.availableTrip.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((Trip) => Trip.id == tripId);
    });
  }

  //final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(categoryTitle),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            //removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
