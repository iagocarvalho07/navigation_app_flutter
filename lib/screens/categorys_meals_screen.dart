import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/components/meals_items.dart';
import 'package:navigation_app_flutter/data/dammy_data.dart';
import 'package:navigation_app_flutter/models/categorys.dart';

class CategorysMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categorysMeals = dummyMeals.where((mels) {
      return mels.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categorysMeals.length,
        itemBuilder: (ctx, index) {
          return MealsItem(meal: categorysMeals[index]);
        },
      ),
    );
  }
}
