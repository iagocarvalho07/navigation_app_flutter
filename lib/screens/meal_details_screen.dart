import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Text(meal.ingredients.first),
      ),
    );
  }
}
