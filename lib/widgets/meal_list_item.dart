import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              width: double.infinity,
              height: 250,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ColoredBox(
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}