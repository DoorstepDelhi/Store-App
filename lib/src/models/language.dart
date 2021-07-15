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
          englishName: "Hindi",
          localName: "हिन्दी",
          flag: "img/Flag_India.jpg"),
    ];
  }

  List<Language> get languages => _languages;
}
