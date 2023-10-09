import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/data/dammy_data.dart';
import 'package:navigation_app_flutter/screens/categorys_Screen.dart';
import 'package:navigation_app_flutter/screens/categorys_meals_screen.dart';
import 'package:navigation_app_flutter/screens/meal_details_screen.dart';
import 'package:navigation_app_flutter/screens/settings_Screen.dart';
import 'package:navigation_app_flutter/screens/tabs_screens.dart';
import 'package:navigation_app_flutter/utils/app_routes.dart';

import 'models/meal.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Setting settins = Setting();
  List<Meal> _avalibleMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filtterMeals(Setting setting) {
    setState(() {
      this.settins = setting;
      _avalibleMeals = dummyMeals.where((meal) {
        final filterGlutten = setting.isGlutenFree && !meal.isGlutenFree;
        final filterVegan = setting.isVegan && !meal.isVegan;
        final filtervegetarian = setting.isVegetarian && !meal.isVegetarian;
        final filterLactose = setting.isLactoseFree && !meal.isLactoseFree;

        return !filterGlutten &&
            !filterLactose &&
            !filtervegetarian &&
            !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meals) {
    setState(() {
      _favoriteMeals.contains(meals)
          ? _favoriteMeals.remove(meals)
          : _favoriteMeals.add(meals);
    });
  }

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
      home: TabsScreen(
        favoriteMeals: _favoriteMeals,
      ),
      routes: {
        AppRputes.CATEGORIES_MEALS: (ctx) =>
            CategorysMealsScreen(_avalibleMeals),
        AppRputes.MEAL_DETAIL: (ctx) => MealDetailsScreen(
              onToggleFavorite: _toggleFavorite,
            ),
        AppRputes.SETTINGS: (ctx) => SettingsScreens(
              onSettingschange: _filtterMeals,
              setting: settins,
            ),
      },
    );
  }
}
