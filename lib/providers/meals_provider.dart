import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_meals.dart';

final mealsProvider = Provider((ref) => dummyMeals);
