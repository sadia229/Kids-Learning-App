import 'package:flutter/material.dart';
import 'package:kid_starter/src/features/home/components/alphabet.dart';
import 'package:kid_starter/src/features/home/components/color.dart';
import 'package:kid_starter/src/features/home/components/number.dart';
import 'package:kid_starter/src/features/home/components/shape.dart';
import 'package:kid_starter/src/features/home/components/story.dart';

import '../components/card/category_card.dart';

List<Widget> categories = [
  CategoryCard(
    title: 'Colors',
    primaryColor: Colors.orangeAccent[100]!,
    secondaryColor: Colors.orange,
    screen: ColorScreen(
      title: 'Colors',
      primaryColorScreen: Colors.orangeAccent.shade100,
      secondaryColorScreen: Colors.orange,
    ),
  ),
  CategoryCard(
    title: '123',
    primaryColor: Colors.greenAccent[100]!,
    secondaryColor: Colors.green,
    screen: NumberScreen(
      title: '123',
      primaryColor: Colors.greenAccent[100]!,
      secondaryColor: Colors.green,
    ),
  ),
  CategoryCard(
    title: 'ABC',
    primaryColor: Colors.purpleAccent[100]!,
    secondaryColor: Colors.purple,
    screen: AlphabetScreen(
      title: 'ABC',
      primaryColor: Colors.purpleAccent[100]!,
      secondaryColor: Colors.purple,
    ),
  ),
  const CategoryCard(
    title: 'Stories',
    primaryColor: Color(0xFF3383CD),
    secondaryColor: Color(0xFF11249F),
    screen: StoryScreen(
      title: 'Stories',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
    ),
  ),
  CategoryCard(
    title: 'Shapes',
    primaryColor: Colors.redAccent[100]!,
    secondaryColor: Colors.red,
    screen: ShapeScreen(
      title: 'Shapes',
      primaryColor: Colors.redAccent[100]!,
      secondaryColor: Colors.red,
    ),
  ),
];
