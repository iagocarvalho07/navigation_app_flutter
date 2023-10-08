import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/screens/categorys_Screen.dart';
import 'package:navigation_app_flutter/screens/categorys_meals_screen.dart';
import 'package:navigation_app_flutter/screens/meal_details_screen.dart';
import 'package:navigation_app_flutter/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
          ),
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(210, 209, 180, 1.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      home: CategoriesScreen(),
      routes: {
        AppRputes.CATEGORIES_MEALS: (ctx) => CategorysMealsScreen(),
        AppRputes.MEAL_DETAIL: (ctx) => MealDetailsScreen()
      },
    );
  }
}
