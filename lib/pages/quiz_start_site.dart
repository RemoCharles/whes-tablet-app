import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/pages/quiz_site.dart';

class QuizStart extends StatefulWidget {
  @override
  _QuizStartState createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'quiz_start_title'),
            style: Styles.textTitle),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Material(elevation: 2.0, child: _sectionUpper()),
            ),
            Expanded(
              flex: 6,
              child:
                  _sectionButton(getTranslated(context, "quiz_start_button")),
            )
          ],
        ),
      ),
    );
  }

  Widget _sectionUpper() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _sectionTitle(getTranslated(context, "quiz_start_title_small")),
              _sectionText(getTranslated(context, "quiz_start_text")),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _sectionImage("assets/images/quiz/quiz.png"),
            ],
          ),
        )
      ],
    );
  }

  Widget _sectionTitle(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child:
          Text(text, textAlign: TextAlign.left, style: Styles.textLowerTitle),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
      child: Text(
        text,
        style: Styles.textText,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _sectionImage(String url) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 5.0),
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: Image.asset(
          url,
        ),
      ),
    );
  }

  Widget _sectionButton(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: SizedBox(
            width: 200.0,
            height: 50.0,
            child: new RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                color: Styles.buttonColor,
                splashColor: Styles.tileHoverColor,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => GetJson()));
                },
                child: new Text(
                  text,
                  style: Styles.textButtonRaised,
                )),
          ),
        ),
      ],
    );
  }
}
