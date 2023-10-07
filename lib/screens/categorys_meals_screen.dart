import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/models/categorys.dart';

class CategorysMealsScreen extends StatelessWidget {
  const CategorysMealsScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
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
