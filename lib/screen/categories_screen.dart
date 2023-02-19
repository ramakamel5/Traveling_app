import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 7 / 8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: Categories_Data.map((categoryData) => Categoriesitems(
          categoryData.title, categoryData.id, categoryData.imageUrl)).toList(),
    );
  }
}
