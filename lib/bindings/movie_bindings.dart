import 'package:get/get.dart';
import 'package:getx_state_management/controller/movie_controller.dart';

import '../services/api_service.dart';

class MovieBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController(APIService()));
  }
}
