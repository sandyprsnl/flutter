import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({required this.categoryId, required this.categoryTitle});
  static const routName = '/category-meals';
  final List<Meal>? availableMeals;
  CategoryMealsScreen({this.availableMeals});
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displaYedMeals;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routArgs['title'].toString();
    final categoryid = routArgs['id'].toString();
    displaYedMeals = widget.availableMeals?.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displaYedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displaYedMeals![index].id,
            title: displaYedMeals![index].title,
            imageUrl: displaYedMeals![index].imageUrl,
            duration: displaYedMeals![index].duration,
            complexity: displaYedMeals![index].complexity,
            affordebality: displaYedMeals![index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displaYedMeals!.length,
      ),
    );
  }
}
