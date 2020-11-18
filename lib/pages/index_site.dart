import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:whes_tablet_app/classes/heritage.dart';
import 'package:whes_tablet_app/classes/language.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';
import 'package:whes_tablet_app/main.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/pages/about_us_site.dart';
import 'package:whes_tablet_app/pages/heritage_detail_site.dart';
import 'package:whes_tablet_app/pages/quiz_start_site.dart';
import 'package:whes_tablet_app/pages/unesco_site.dart';

class IndexSite extends StatefulWidget {
  IndexSite({Key key, this.heritages}) : super(key: key);
  final List<Heritage> heritages;

  @override
  _IndexSiteState createState() => _IndexSiteState();
}

class _IndexSiteState extends State<IndexSite> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Image indexBackground;
  Image drawerHeader;

  @override
  void initState() {
    super.initState();
    indexBackground = Image.asset("assets/images/karte_schweiz.png");
    drawerHeader = Image.asset("assets/images/WHES_Website_Logo.png");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(indexBackground.image, context);
    precacheImage(drawerHeader.image, context);
  }

  void _changeLanguage(Language languagecode) async {
    Locale _locale = await setLocale(languagecode.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[_dropDownButton()],
        title: Text(getTranslated(context, 'index_title'),
            style: Styles.textTitle),
      ),
      body: _backgroundContent(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(5),
          children: <Widget>[
            _drawerHeader(),
            _drawer(
                getTranslated(context, 'UNESCO Welterbe'), context, Unesco()),
            _drawer(getTranslated(context, 'Quiz'), context, QuizStart()),
            _drawer(getTranslated(context, 'Über uns'), context, AboutUs()),
            _drawerExpansion(getTranslated(context, 'Sprache'), context)
          ],
        ),
      ),
    );
  }

  Widget _dropDownButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<Language>(
        underline: SizedBox(),
        icon: Icon(
          Icons.language,
          color: Styles.iconColor,
        ),
        onChanged: (Language language) {
          _changeLanguage(language);
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(e.flag, width: 25, height: 25),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                      child: Text(
                        e.name,
                        style: Styles.textText,
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _drawer(String text, BuildContext context, Widget function) {
    return ListTile(
      title: Text(text, style: Styles.textLowerTitle),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => function));
      },
    );
  }

  Widget _drawerExpansion(String text, BuildContext context) {
    return ExpansionTile(
      title: Text(text, style: Styles.textLowerTitle),
      childrenPadding: EdgeInsets.fromLTRB(15, 5, 5, 5),
      children: <Widget>[
        for (var language in Language.languageList())
          _drawerExpansionTile(language)
      ],
    );
  }

  Widget _drawerExpansionTile(Language language) {
    return ListTile(
      leading: Image.asset(language.flag, width: 25, height: 25),
      title: Text(language.name, style: Styles.textText),
      onTap: () {
        _changeLanguage(language);
      },
    );
  }

  Widget _drawerHeader() {
    return Container(
      child: DrawerHeader(
          child: Text('', style: Styles.textLowerTitle),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: drawerHeader.image, fit: BoxFit.none))),
    );
  }

  Widget _backgroundContent() {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: indexBackground.image,
            )),
        child: _iconContent());
  }

  Widget _iconContent() {
    return Stack(children: <Widget>[
      for (var heritage in widget.heritages) _iconBuilder(heritage)
    ]);
  }

  Widget _iconBuilder(Heritage heritage) {
    return Container(
        child: Positioned(
            bottom: heritage.bottomIcon,
            right: heritage.rightIcon,
            child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        actions: _popUpButton(heritage),
                        contentPadding: EdgeInsets.zero,
                        content: _popUpBuilder(heritage.urlPopUp,
                            heritage.titlePopUp, heritage.textPopUp)),
                  );
                },
                child: _iconDesign(heritage))));
  }

  Widget _iconDesign(Heritage heritage) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Styles.PrimaryColor),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  heritage.urlIcon,
                ))));
  }

  Widget _popUpBuilder(String url, String title, String text) {
    return Container(
        width: 400,
        height: 300,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _popUpPicture(url),
              _popUpTitle(getTranslated(context, title)),
              _popUpText(getTranslated(context, text)),
            ]));
  }

  Widget _popUpTitle(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 25.0, 0.0),
        child: Text(text,
            textAlign: TextAlign.start, style: Styles.textPopUpTitle));
  }

  Widget _popUpText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 25.0, 0.0),
        child: Text(
          text,
          style: Styles.textText,
          textAlign: TextAlign.justify,
        ));
  }

  Widget _popUpPicture(String url) {
    return Container(
      width: 400,
      height: 150,
      padding: const EdgeInsets.all(0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        child: FadeInImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(url),
          placeholder: MemoryImage(kTransparentImage),
        ),
      ),
    );
  }

  List<Widget> _popUpButton(Heritage heritage) {
    return <Widget>[
      FlatButton(
        child: new Text(
          getTranslated(context, "button_cancel"),
          style: Styles.textButtonFlat,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      FlatButton(
          child: new Text(
            getTranslated(context, "button_more"),
            style: Styles.textButtonFlat,
          ),
          onPressed: () => _navigationToHeritageDetail(context, heritage))
    ];
  }

  void _navigationToHeritageDetail(BuildContext context, Heritage heritage) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HeritageDetail(heritage),
        ));
  }
}
