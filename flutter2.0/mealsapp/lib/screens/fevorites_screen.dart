import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FevoritesScreen extends StatelessWidget {
  // const FevoritesScreen({ Key? key }) : super(key: key);
  final List<Meal>? fevoriteMeals;
  FevoritesScreen({this.fevoriteMeals});
  @override
  Widget build(BuildContext context) {
    if (fevoriteMeals!.isEmpty) {
      return Center(
        child: Text('You have no Fevorites yet -start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: fevoriteMeals![index].id,
            title: fevoriteMeals![index].title,
            imageUrl: fevoriteMeals![index].imageUrl,
            duration: fevoriteMeals![index].duration,
            complexity: fevoriteMeals![index].complexity,
            affordebality: fevoriteMeals![index].affordability,
          );
        },
        itemCount: fevoriteMeals!.length,
      );
    }
  }
}
