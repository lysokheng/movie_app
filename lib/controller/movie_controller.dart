import 'package:get/get.dart';
import 'package:getx_state_management/models/movie_res_model.dart';
import 'package:getx_state_management/services/api_service.dart';

class MovieController extends GetxController {
  APIService service = APIService();
  MovieResModel? movieResModel;
  bool isLoading = false;
  @override
  void onInit() {
    fetchMovie();
    super.onInit();
  }

  Future<void> fetchMovie() async {
    isLoading = true;
    final res = await service.getLastMovie();
    if (res != null) {
      movieResModel = res;
      update();
    } else {
      movieResModel = res;
    }
    isLoading = false;
  }
}
