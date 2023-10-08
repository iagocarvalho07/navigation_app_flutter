import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/models/categorys.dart';

class CategorysMealsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text("Receitas Por Categoria ${category.id}"),
      ),
    );
  }
}
