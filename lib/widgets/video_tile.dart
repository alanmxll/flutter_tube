import 'package:flutter/material.dart';
import 'package:flutter_tube/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;

  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(video.thumb, fit: BoxFit.cover),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Text(video.title),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(video.channel),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}