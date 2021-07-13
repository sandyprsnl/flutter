import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
// import './category_meals_screen.dart';

class MealCategoryItem extends StatelessWidget {
  // const MealCategoryItem({Key? key}) : super(key: key);
  final String id;
  final String title;
  final Color color;

  MealCategoryItem(
      {required this.id, required this.title, required this.color});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
        // '/categories-meals', arguments: {'id': id, 'title': title}
        CategoryMealsScreen.routName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
