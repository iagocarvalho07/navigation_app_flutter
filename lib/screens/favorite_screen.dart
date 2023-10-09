import 'package:flutter/cupertino.dart';
import 'package:navigation_app_flutter/components/meals_items.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma Refeição foi marcada como favorita'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealsItem(
            meal: favoriteMeals[index],
          );
        },
      );
    }
  }
}
