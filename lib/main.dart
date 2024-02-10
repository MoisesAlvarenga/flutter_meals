import 'package:flutter/material.dart';
import 'package:flutter_meals/data/dummy_data.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/models/settings.dart';
import 'package:flutter_meals/screens/meal_detail_screen.dart';
import 'package:flutter_meals/screens/settings_screen.dart';
import 'package:flutter_meals/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app-routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        final filterGlutten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isLactoseFree && !meal.isVegan;
        final filterVegetarian = settings.isLactoseFree && !meal.isVegetarian;

        return !filterGlutten &&
            !filterLactose &&
            !filterVegan & !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1));
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (ctx) => MealDeetailScreen(),
        AppRoutes.settings: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
