
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/movie_controller.dart';
import 'package:getx_state_management/screen/detail_screen.dart';


class HomeScreen extends GetView<MovieController> {
  const HomeScreen({Key? key}) : super(key: key);

  // MovieController controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
            itemCount: state!.results!.length,
            itemBuilder: (context, index) {
              var data = state.results![index];
              var image = "http://image.tmdb.org/t/p/w500/${data.backdropPath}";
              return GestureDetector(
                onTap: () {
                  Get.to(DetailScreen(
                      title: data.title!,
                      subTitle: data.overview!,
                      imgURL: image));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        image != null
                            ? CachedNetworkImage(
                                imageUrl: image,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            data.title.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            data.overview.toString(),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.fetchMovie();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
