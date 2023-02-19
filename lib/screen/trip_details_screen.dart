import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  final Function managFavorite;
  final Function isFavorite;

  TripDetailsScreen(this.managFavorite, this.isFavorite);

  // ignore: non_constant_identifier_names
  Widget BuildSectionTitle(BuildContext context, String titileText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titileText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildListView(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((Trip) => Trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BuildSectionTitle(context, 'الأنشطة :'),
            BuildListView(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BuildSectionTitle(context, 'البرنامج اليومي :'),
            BuildListView(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(isFavorite(tripId) ? Icons.star : Icons.star_border),
        onPressed: () => managFavorite(tripId),
      ),
    );
  }
}
