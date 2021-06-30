class Language {
  String englishName;
  String localName;
  String flag;

  Language({this.englishName, this.localName, this.flag});
}

class LanguagesList {
  List<Language> _languages;

  LanguagesList() {
    this._languages = [
      new Language(
          englishName: "English",
          localName: "English",
          flag: "img/united-states-of-america.png"),
      new Language(
          englishName: "Arabic",
          localName: "العربية",
          flag: "img/united-arab-emirates.png"),
      new Language(
          englishName: "Spanish", localName: "Spana", flag: "img/spain.png"),
      new Language(
          englishName: "French (France)",
          localName: "Français - France",
          flag: "img/france.png"),
      new Language(
          englishName: "French (Canada)",
          localName: "Français - Canadien",
          flag: "img/canada.png"),
      new Language(
          englishName: "Brazilian",
          localName: "Brazilian",
          flag: "img/brazil.png"),
      new Language(
          englishName: "Deutsh", localName: "Deutsh", flag: "img/germany.png"),
      new Language(
          englishName: "Chineeze",
          localName: "Chineeze",
          flag: "img/china.png"),
      new Language(
          englishName: "Italian", localName: "Italiano", flag: "img/italy.png"),
      new Language(
          englishName: "Netherlands",
          localName: "Netherlands",
          flag: "img/netherlands.png"),
    ];
  }

  List<Language> get languages => _languages;
}
