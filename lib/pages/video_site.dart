import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';
import 'package:whes_tablet_app/classes/styles.dart';

class Video extends StatefulWidget {
  Video({Key key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController playerController;

  @override
  void initState() {
    playerController = VideoPlayerController.asset(
      'assets/videos/unesco_video.mp4',
    )..initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, "Video"),
          style: Styles.textTitle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Center(
          child: playerController.value.initialized
              ? AspectRatio(
                  aspectRatio: playerController.value.aspectRatio,
                  child: VideoPlayer(playerController),
                )
              : Container(
                  child: Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Styles.progressColor)))),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
            child: FloatingActionButton(
              backgroundColor: Styles.selectedIconColor,
              onPressed: () {
                setState(() {
                  playerController.value.isPlaying
                      ? playerController.pause()
                      : playerController.play();
                });
              },
              child: Icon(
                playerController.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
              heroTag: null,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
            child: FloatingActionButton(
              backgroundColor: Styles.selectedIconColor,
              onPressed: () {
                {
                  if (!playerController.value.isPlaying) {
                    setState(() {});
                    playerController.initialize();
                    playerController.play();
                  }
                }
              },
              child: Icon(
                Icons.replay,
              ),
              heroTag: null,
            ),
          ),
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
    playerController.dispose();
  }
}
