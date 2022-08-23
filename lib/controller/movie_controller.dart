import 'package:get/get.dart';
import 'package:getx_state_management/models/movie_res_model.dart';
import 'package:getx_state_management/services/api_service.dart';

class MovieController extends GetxController with StateMixin<MovieResModel> {
  APIService service = APIService();

  MovieController(this.service);

  @override
  void onInit() {
    fetchMovie();
    super.onInit();
  }

  Future<void> fetchMovie() async {
    change(null, status: RxStatus.loading());

    final res = await service.getLastMovie();
    if (res != null) {
      if (res.results!.isNotEmpty) {
        change(res, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } else {
      change(null, status: RxStatus.error('failed to get data'));
    }
  }
}
