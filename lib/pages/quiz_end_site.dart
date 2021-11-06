import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whes_tablet_app/classes/heritage_data.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';
import 'package:whes_tablet_app/pages/index_site.dart';
import 'package:whes_tablet_app/pages/quiz_start_site.dart';

// ignore: must_be_immutable
class Result extends StatefulWidget {
  final heritageData = HeritageData.fetchAll();
  int marks;
  Result({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultState createState() => _ResultState(marks);
}

class _ResultState extends State<Result> {
  List<String> images = [
    "assets/images/quiz/gold-medal.png",
    "assets/images/quiz/silver-medal.png",
    "assets/images/quiz/bronze-medal.png",
    "assets/images/quiz/bad.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks == 5) {
      image = images[0];
      message = "quiz_5_text";
    } else if (marks == 4) {
      image = images[1];
      message = "quiz_4_text";
    } else if (marks == 3) {
      image = images[2];
      message = "quiz_3_text";
    } else if (marks == 2) {
      image = images[3];
      message = "quiz_2_text";
    } else if (marks == 1) {
      image = images[3];
      message = "quiz_1_text";
    } else if (marks == 0) {
      image = images[3];
      message = "quiz_0_text";
    }
    super.initState();
  }

  int marks;
  _ResultState(this.marks);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'quiz_end_title'),
            style: Styles.textTitle),
      ),
      body: Column(
        children: <Widget>[_renderTextAndImage(), _endButtons()],
      ),
    );
  }

  Widget _endImage() {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: 300.0,
        height: 300.0,
        child: Image(image: AssetImage(image)),
      ),
    );
  }

  Widget _endText() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          getTranslated(context, message),
          style: Styles.textText,
        ),
      ),
    );
  }

  Widget _renderTextAndImage() {
    return Expanded(
      flex: 7,
      child: Material(
        elevation: 2.0,
        child: Container(
            child: Column(
          children: <Widget>[_endImage(), _endText()],
        )),
      ),
    );
  }

  Widget _endButtons() {
    return Expanded(
      flex: 3,
      child: Row(
        children: <Widget>[
          Expanded(flex: 5, child: _againQuizButton()),
          Expanded(flex: 5, child: _endQuizButton()),
        ],
      ),
    );
  }

  Widget _againQuizButton() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: SizedBox(
        width: 200.0,
        height: 50.0,
        child: ElevatedButton(
          child: Text(
            getTranslated(context, "quiz_again_button"),
            style: Styles.textButtonRaised,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => QuizStart()));
          },
        ),
      ),
    );
  }

  Widget _endQuizButton() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: SizedBox(
        width: 200.0,
        height: 50.0,
        child: ElevatedButton(
          child: Text(
            getTranslated(context, "quiz_end_button"),
            style: Styles.textButtonRaised,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    IndexSite(heritages: widget.heritageData)));
          },
        ),
      ),
    );
  }
}
