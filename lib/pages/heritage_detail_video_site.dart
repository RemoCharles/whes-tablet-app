import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage.dart';
import 'package:whes_tablet_app/classes/video_items.dart';
import 'package:video_player/video_player.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';

class HeritageDetailVideo extends StatelessWidget {
  final Heritage heritage;
  HeritageDetailVideo(this.heritage);

  @override
  Widget build(BuildContext context) {
    //sofern Video vorhanden in heritage_data wird der Controller mit dem Video geladen
    if (heritage.heritageVideo != null) {
      return Scaffold(
          body:
              _videoController(getTranslated(context, heritage.heritageVideo)));
    }
    return Scaffold(
        body: _videoControllerPlaceholder(
            getTranslated(context, "video_placeholder")));
  }

  Widget _videoController(String videoTitle) {
    return Container(
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Center(
          child: VideoItems(
            videoPlayerController: VideoPlayerController.asset(videoTitle),
            looping: false,
            autoplay: false,
          ),
        ));
  }

  Widget _videoControllerPlaceholder(String videoTitle) {
    return Container(
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Center(
          child: VideoItems(
            videoPlayerController: VideoPlayerController.asset(videoTitle),
            looping: false,
            autoplay: false,
          ),
        ));
  }
}
