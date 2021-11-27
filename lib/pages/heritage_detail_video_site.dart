import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';
import 'package:whes_tablet_app/classes/video_items.dart';
import 'package:video_player/video_player.dart';

class HeritageDetailVideo extends StatelessWidget {
  final Heritage heritage;
  HeritageDetailVideo(this.heritage);
  @override
  Widget build(BuildContext context) {
    return _videoController(context);
  }

  Widget _videoController(context) {
    return Container(
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Center(
          child: VideoItems(
            videoPlayerController: VideoPlayerController.asset(
                getTranslated(context, 'video_general')),
            looping: false,
            autoplay: false,
          ),
        ));
  }
}
