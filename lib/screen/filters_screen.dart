import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final dynamic saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var Summer = false;
  var Winter = false;
  var ForFamily = false;

  @override
  void initState() {
    Summer = widget.currentFilters['summer']!;
    Winter = widget.currentFilters['winter']!;
    ForFamily = widget.currentFilters['family']!;
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, var currentValue, dynamic updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'summer': Summer,
                  'winter': Winter,
                  'family': ForFamily,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'الرحلات الصيفية', 'إظهار الرحلات الصيفية فقط', Summer,
                    (newVAlue) {
                  setState(() {
                    Summer = newVAlue;
                  });
                }),
                buildSwitchListTile(
                    'الرحلات الشتوية', 'إظهار الرحلات الشتوية فقط', Winter,
                    (newVAlue) {
                  setState(() {
                    Winter = newVAlue;
                  });
                }),
                buildSwitchListTile(
                    'للعائلات ', 'إظهار الرحلات التي للعائلات فقط', ForFamily,
                    (newVAlue) {
                  setState(() {
                    ForFamily = newVAlue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
