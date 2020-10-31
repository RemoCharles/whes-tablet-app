class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "DE", "Deutsch", "de"),
      Language(2, "FR", "Francais", "fr"),
      Language(3, "IT", "Italiano", "it"),
      Language(4, "EN", "English", "en"),
    ];
  }
}
