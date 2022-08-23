import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  String? imgURL;

  DetailScreen(
      {required this.title, required this.subTitle, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
              const SizedBox(height: 12,),
              imgURL != null ?
              CachedNetworkImage(
                imageUrl: imgURL!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ) : Container(),
              SizedBox(height: 12,),
              Text(subTitle, style: TextStyle(fontSize: 14),),
            ],
          ),
        ),
      ),
    );
  }
}
