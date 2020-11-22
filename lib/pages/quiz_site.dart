import 'dart:async';
import 'dart:convert';
import 'dart:math';

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
  var randomArray;

  Map<String, Color> btncolor = {
    "a": Styles.buttonColor,
    "b": Styles.buttonColor,
    "c": Styles.buttonColor,
    "d": Styles.buttonColor,
  };

  bool canceltimer = false;

  genRandomArray() {
    var rand = new Random();
    for (i = rand.nextInt(9) + 1;;) {
      var list = new List<int>.generate(10, (int index) => index + 1);
      list.shuffle();
      randomArray = list.toSet().toList();
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
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
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
        FlatButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          IndexSite(heritages: widget.heritageData)),
                  (Route<dynamic> route) => false);
            },
            child: Text(getTranslated(context, "button_quiz_yes"),
                style: Styles.textButtonFlat)),
        FlatButton(
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
        width: 200.0,
        height: 50.0,
        child: new RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          onPressed: () => checkAnswer(k),
          child: new Text(
            mydata[1][i.toString()][k],
            style: Styles.textButtonRaised,
            maxLines: 1,
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
