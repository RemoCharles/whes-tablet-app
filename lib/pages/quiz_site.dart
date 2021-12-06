import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whes_tablet_app/classes/heritage_data.dart';

import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';
import 'package:whes_tablet_app/pages/index_site.dart';
import 'package:whes_tablet_app/pages/quiz_end_site.dart';

class GetJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String assettoload;
// checking the set language locale and loading the file with questions
    setasset() {
      if (myLocale.languageCode == "en") {
        assettoload = "assets/questions/english_q.json";
      } else if (myLocale.languageCode == "de") {
        assettoload = "assets/questions/deutsch_q.json";
      } else if (myLocale.languageCode == "fr") {
        assettoload = "assets/questions/francais_q.json";
      } else {
        assettoload = "assets/questions/italiano_q.json";
      }
    }

    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        } else {
          return Quiz(mydata: mydata);
        }
      },
    );
  }
}

class Quiz extends StatefulWidget {
  final heritageData = HeritageData.fetchAll();
  final List mydata;
  Quiz({Key key, @required this.mydata}) : super(key: key);

  @override
  _QuizState createState() => _QuizState(mydata);
}

class _QuizState extends State<Quiz> {
  final List mydata;
  _QuizState(this.mydata);

  Color colortoshow = Styles.buttonColor;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;
  int j = 1;
  int timer = 30;
  String showtimer = "30";
  List<int> randomArray = [];

  Map<String, Color> btncolor = {
    "a": Styles.buttonColor,
    "b": Styles.buttonColor,
    "c": Styles.buttonColor,
    "d": Styles.buttonColor,
  };

  bool canceltimer = false;

  genRandomArray() {
    // ignore: unused_local_variable
    for (int i = 0;;) {
      var list =
          new List<int>.generate(26, (int index) => index + 1, growable: true);
      list.shuffle();
      randomArray = list;
      if (randomArray.length < 5) {
        continue;
      } else {
        break;
      }
    }
    print(randomArray);
  }

  @override
  void initState() {
    starttimer();
    genRandomArray();
    // initialize that i is the first index of randomArray
    i = randomArray[0];
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextQuestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 5) {
        i = randomArray[j];
        j++;
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Result(marks: marks)),
            (Route<dynamic> route) => false);
      }
      btncolor["a"] = Styles.buttonColor;
      btncolor["b"] = Styles.buttonColor;
      btncolor["c"] = Styles.buttonColor;
      btncolor["d"] = Styles.buttonColor;
      disableAnswer = false;
    });
    starttimer();
  }

  void checkAnswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 1;
      for (var key in btncolor.keys) {
        key == k ? btncolor[key] = right : btncolor[key] = wrong;
      }
    } else {
      for (var key in btncolor.keys) {
        mydata[2][i.toString()] == mydata[1][i.toString()][key]
            ? btncolor[key] = right
            : btncolor[key] = wrong;
      }
    }
    setState(() {
      canceltimer = true;
      disableAnswer = true;
    });
    Timer(Duration(seconds: 2), nextQuestion);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
              title: Text(
            getTranslated(context, "quiz_question1") +
                j.toString() +
                getTranslated(context, "quiz_question2"),
            style: Styles.textTitle,
          )),
          body: Column(
            children: <Widget>[
              _questionImage(mydata[3][i.toString()]),
              _questionText(mydata[0][i.toString()]),
              _questionButtons(),
              _questionTimer(),
            ],
          ),
        ),
        onWillPop: () {
          return showDialog(
              context: context, builder: (context) => _questionPopUp());
        });
  }

  Widget _questionPopUp() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text(
        getTranslated(context, "button_quiz_title"),
        style: Styles.textPopUpTitle,
        textAlign: TextAlign.justify,
      ),
      content: Text(
        getTranslated(context, "button_quiz_text"),
        style: Styles.textText,
        textAlign: TextAlign.justify,
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          IndexSite(heritages: widget.heritageData)),
                  (Route<dynamic> route) => false);
            },
            child: Text(getTranslated(context, "button_quiz_yes"),
                style: Styles.textButtonFlat)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(getTranslated(context, "button_quiz_no"),
                style: Styles.textButtonFlat)),
      ],
    );
  }

  Widget _questionImage(String url) {
    return Expanded(
      flex: 2,
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(url), fit: BoxFit.fitWidth),
          )),
    );
  }

  Widget _questionText(String text) {
    return Expanded(
      flex: 2,
      child: Material(
        elevation: 2.0,
        child: Container(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 500.0, 0.0),
            alignment: Alignment.centerLeft,
            child: Text(text,
                textAlign: TextAlign.justify, style: Styles.textText)),
      ),
    );
  }

  Widget _questionButton(String k) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: SizedBox(
        width: 400.0,
        height: 100.0,
        child: new RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          onPressed: () => checkAnswer(k),
          child: new Text(
            mydata[1][i.toString()][k],
            style: Styles.textButtonRaised,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          color: btncolor[k],
          splashColor: Styles.tileHoverColor,
          highlightColor: Styles.tileHoverColor,
        ),
      ),
    );
  }

  Widget _questionButtons() {
    return Expanded(
      flex: 5,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: AbsorbPointer(
                absorbing: disableAnswer,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _questionButton("a"),
                      _questionButton("c"),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: AbsorbPointer(
                absorbing: disableAnswer,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _questionButton("b"),
                      _questionButton("d"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _questionTimer() {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.topCenter,
        child: Center(
          child: Text(showtimer, style: Styles.textLowerTitle),
        ),
      ),
    );
  }
}
