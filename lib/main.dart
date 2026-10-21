import 'app/app.dart';
import 'app/orientation_config.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'controllers/favorite_controller.dart';
import 'controllers/meals_controller.dart';
import 'controllers/schedule_controller.dart';
import 'repositories/favorite_repository.dart';
import 'repositories/recipe_repository.dart';
import 'repositories/schedule_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OrientationConfig.setPortrait();
  Get.put(RecipeRepository(), permanent: true);
  Get.put(FavoriteRepository(), permanent: true);
  Get.put(ScheduleRepository(), permanent: true);
  Get.put(MealsController(Get.find<RecipeRepository>()), permanent: true);
  Get.put(FavoriteController(Get.find<FavoriteRepository>()), permanent: true);
  Get.put(ScheduleController(Get.find<ScheduleRepository>()), permanent: true);
  runApp(const ResepinApp());
}
