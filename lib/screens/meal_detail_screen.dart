import 'package:flutter/material.dart';
import 'package:flutter_meals/models/meal.dart';

class MealDeetailScreen extends StatelessWidget {
  const MealDeetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Center(child: Text('Detalhes da Refeição')),
    );
  }
}
