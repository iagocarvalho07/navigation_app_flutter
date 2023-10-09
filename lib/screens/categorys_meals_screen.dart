import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/components/meals_items.dart';
import 'package:navigation_app_flutter/data/dammy_data.dart';
import 'package:navigation_app_flutter/models/categorys.dart';

import '../models/meal.dart';

class CategorysMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategorysMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categorysMeals = meals.where((mels) {
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
