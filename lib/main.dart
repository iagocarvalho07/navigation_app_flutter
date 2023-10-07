import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/screens/categorys_Screen.dart';

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
          canvasColor: Color.fromRGBO(210, 209, 180, 1.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      home: CategoriesScreen(),
    );
  }
}
