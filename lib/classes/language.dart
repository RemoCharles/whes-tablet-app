class Language {
  final String languageCode;
  final String name;
  final String flag;

  Language(this.languageCode, this.name, this.flag);

  static List<Language> languageList() {
    return <Language>[
      Language("de", "Deutsch", "assets/images/deutschland.png"),
      Language("fr", "Francais", "assets/images/frankreich.png"),
      Language("it", "Italiano", "assets/images/italien.png"),
      Language("en", "English", "assets/images/england.png"),
    ];
  }
}
