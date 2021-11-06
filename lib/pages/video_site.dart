import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:whes_tablet_app/classes/video_items.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';
import 'package:whes_tablet_app/classes/styles.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            getTranslated(context, "Video"),
            style: Styles.textTitle,
          ),
        ),
        body: _videoController(context));
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
