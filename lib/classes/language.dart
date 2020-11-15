class Language {
  final String languageCode;
  final String name;
  final String flag;

  Language(this.languageCode, this.name, this.flag);

  static List<Language> languageList() {
    return <Language>[
      Language("de", "Deutsch", "assets/images/lang/deutschland.png"),
      Language("fr", "Francais", "assets/images/lang/frankreich.png"),
      Language("it", "Italiano", "assets/images/lang/italien.png"),
      Language("en", "English", "assets/images/lang/england.png"),
    ];
  }
}
