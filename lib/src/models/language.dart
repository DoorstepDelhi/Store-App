class Language {
  String englishName;
  String localName;
  String flag;

  Language(this.englishName, this.localName, this.flag);
}

class LanguagesList {
  List<Language> _languages;

  LanguagesList() {
    this._languages = [
<<<<<<< Updated upstream
      new Language("English", "English", "img/united-states-of-america.png"),
      new Language("Arabic", "العربية", "img/united-arab-emirates.png"),
      new Language("Spanish", "Spana", "img/spain.png"),
      new Language("French (France)", "Français - France", "img/france.png"),
      new Language("French (Canada)", "Français - Canadien", "img/canada.png"),
      new Language("Brazilian", "Brazilian", "img/brazil.png"),
      new Language("Deutsh", "Deutsh", "img/germany.png"),
      new Language("Chineeze", "Chineeze", "img/china.png"),
      new Language("Italian", "Italiano", "img/italy.png"),
      new Language("Netherlands", "Netherlands", "img/netherlands.png"),
=======
      new Language(
          englishName: "English",
          localName: "English",
          flag: "img/united-states-of-america.png"),
      new Language(
          englishName: "Hindi",
          localName: "हिन्दी",
          flag: "img/Flag_India.jpg"),
>>>>>>> Stashed changes
    ];
  }

  List<Language> get languages => _languages;
}
