import 'package:whes_tablet_app/classes/heritage.dart';

class HeritageData extends Heritage {
  static final List<Heritage> items = [
    Heritage(
        titleDetail: "title_bellinzona",
        urlDetail: "assets/images/headers/Castelgrande2.jpg",
        bottomIcon: 50,
        rightIcon: 390,
        urlIcon: "assets/images/icons/bellinzona.png",
        titlePopUp: "title_bellinzona",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/Castelgrande2.jpg"),
    Heritage(
        titleDetail: "title_bahn",
        urlDetail: "assets/images/headers/bahn.jpg",
        bottomIcon: 210,
        rightIcon: 200,
        urlIcon: "assets/images/icons/albula_bernina.png",
        titlePopUp: "title_bahn",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/bahn.jpg"),
    Heritage(
        titleDetail: "title_bern",
        urlDetail: "assets/images/headers/bern.jpg",
        bottomIcon: 320,
        rightIcon: 800,
        urlIcon: "assets/images/icons/bern.png",
        titlePopUp: "title_bern",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/bern.jpg"),
    Heritage(
        titleDetail: "title_chaux",
        urlDetail: "assets/images/headers/la_chaux_de_fonds.jpg",
        bottomIcon: 380,
        rightIcon: 1000,
        urlIcon: "assets/images/icons/chaux_de_fonds.png",
        titlePopUp: "title_chaux",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/la_chaux_de_fonds.jpg"),
    Heritage(
        titleDetail: "title_corbusier",
        urlDetail: "assets/images/headers/le_corbusier.png",
        bottomIcon: 170,
        rightIcon: 960,
        urlIcon: "assets/images/icons/corbusier.png",
        titlePopUp: "title_corbusier",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/le_corbusier.png"),
    Heritage(
        titleDetail: "title_alpen",
        urlDetail: "assets/images/headers/aletsch.jpg",
        bottomIcon: 180,
        rightIcon: 690,
        urlIcon: "assets/images/icons/jungfrau_aletsch.png",
        titlePopUp: "title_alpen",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/aletsch.jpg"),
    Heritage(
        titleDetail: "title_lavaux",
        urlDetail: "assets/images/headers/lavaux.JPEG",
        bottomIcon: 190,
        rightIcon: 1020,
        urlIcon: "assets/images/icons/lavaux.png",
        titlePopUp: "title_lavaux",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/lavaux.JPEG"),
    Heritage(
        titleDetail: "title_mustair",
        urlDetail: "assets/images/headers/mustair.jpg",
        bottomIcon: 240,
        rightIcon: 55,
        urlIcon: "assets/images/icons/mustair.png",
        titlePopUp: "title_mustair",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/mustair.jpg"),
    Heritage(
        titleDetail: "title_pfahlbauten",
        urlDetail: "assets/images/headers/pfahlbauten.jpg",
        bottomIcon: 450,
        rightIcon: 700,
        urlIcon: "assets/images/icons/pfahlbauten.png",
        titlePopUp: "title_pfahlbauten",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/pfahlbauten.jpg"),
    Heritage(
        titleDetail: "title_monte",
        urlDetail: "assets/images/headers/monte.jpg",
        bottomIcon: 10,
        rightIcon: 430,
        urlIcon: "assets/images/icons/san_giorgio.png",
        titlePopUp: "title_monte",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/monte.jpg"),
    Heritage(
        titleDetail: "title_arena",
        urlDetail: "assets/images/headers/arena.jpg",
        bottomIcon: 350,
        rightIcon: 370,
        urlIcon: "assets/images/icons/sardona.png",
        titlePopUp: "title_arena",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/arena.jpg"),
    Heritage(
        titleDetail: "title_gallen",
        urlDetail: "assets/images/headers/st_gallen.jpg",
        bottomIcon: 530,
        rightIcon: 310,
        urlIcon: "assets/images/icons/st_gallen.png",
        titlePopUp: "title_gallen",
        textPopUp: "Text",
        urlPopUp: "assets/images/headers/st_gallen.jpg")
  ];
  static Heritage fetchAny() {
    return HeritageData.items[0];
  }

  static List<Heritage> fetchAll() {
    return HeritageData.items;
  }
}
