import 'package:flutter/material.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';
import 'package:whes_tablet_app/classes/styles.dart';

class QuizStart extends StatefulWidget {
  QuizStart({Key key}) : super(key: key);

  @override
  _QuizStartState createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'quiz_start_title'),
            style: Styles.textTitle),
      ),
    );
  }
}
