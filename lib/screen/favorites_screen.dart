// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Trip> favoriteTrip;

  const FavoriteScreen(this.favoriteTrip);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrip.isEmpty) {
      return Center(
        child: Text('ليس لديك أي رحلة في قائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoriteTrip[index].id,
            title: favoriteTrip[index].title,
            imageUrl: favoriteTrip[index].imageUrl,
            duration: favoriteTrip[index].duration,
            tripType: favoriteTrip[index].tripType,
            season: favoriteTrip[index].season,
          );
        },
        itemCount: favoriteTrip.length,
      );
    }
  }
}
