import 'dart:ui';

import 'package:template_bloc/gen/assets.gen.dart';

enum Language {
  english(languageCode: 'en', languageNameEnglish: 'English', languageName: 'English'),
  spanish(languageCode: 'es', languageNameEnglish: 'Spanish', languageName: 'Español'),
  portuguese(
    languageCode: 'pt',
    languageNameEnglish: 'Portuguese (Brazil)',
    languageName: 'Português (Brasil)',
  ),
  hindi(languageCode: 'hi', languageNameEnglish: 'Hindi', languageName: 'हिंदी'),
  korean(languageCode: 'ko', languageNameEnglish: 'Korean', languageName: '한국어'),
  japanese(languageCode: 'ja', languageNameEnglish: 'Japanese', languageName: '日本語'),
  german(languageCode: 'de', languageNameEnglish: 'German', languageName: 'Deutsch'),
  french(languageCode: 'fr', languageNameEnglish: 'French', languageName: 'Français'),
  italian(languageCode: 'it', languageNameEnglish: 'Italian', languageName: 'Italiano'),
  indonesian(
    languageCode: 'id',
    languageNameEnglish: 'Indonesian',
    languageName: 'Bahasa Indonesia',
  ),
  chinese(languageCode: 'zh', languageNameEnglish: 'Chinese', languageName: '中文'),
  vietnamese(languageCode: 'vi', languageNameEnglish: 'Vietnamese', languageName: 'Tiếng Việt'),
  russian(languageCode: 'ru', languageNameEnglish: 'Russian', languageName: 'Русский'),
  turkish(languageCode: 'tr', languageNameEnglish: 'Turkish', languageName: 'Türkçe');

  const Language({
    this.languageCode = 'en',
    this.languageNameEnglish = 'English',
    this.languageName = 'English',
  });

  final String languageCode;
  final String languageNameEnglish;
  final String languageName;
}

extension LanguageExtension on Language {
  String get nameEnglish => languageNameEnglish;

  String get name => languageName;

  String get code => languageCode;

  Locale get locale {
    if (languageCode.contains('-')) {
      final parts = languageCode.split('-');
      return Locale(parts.first, parts.last);
    } else {
      return Locale(languageCode);
    }
  }

  AssetGenImage get image {
    return switch (this) {
      Language.english => Assets.images.language.english,
      Language.vietnamese => Assets.images.language.vietnam,
      Language.french => Assets.images.language.france,
      Language.spanish => Assets.images.language.spain,
      Language.portuguese => Assets.images.language.portugal,
      Language.chinese => Assets.images.language.china,
      Language.hindi => Assets.images.language.hindi,
      Language.german => Assets.images.language.germany,
      Language.italian => Assets.images.language.italy,
      Language.japanese => Assets.images.language.japan,
      Language.korean => Assets.images.language.korea,
      Language.russian => Assets.images.language.russia,
      Language.turkish => Assets.images.language.turkey,
      Language.indonesian => Assets.images.language.indonesia,
    };
  }

  static Language fromCode(String code) {
    return Language.values.firstWhere(
      (language) => language.languageCode == code,
      orElse: () => Language.english,
    );
  }

  static Language fromName(String name) {
    return Language.values.firstWhere(
      (language) => language.languageName == name,
      orElse: () => Language.english,
    );
  }
}

extension LanguageStringExtension on String {
  Language fromCode() {
    return Language.values.firstWhere(
      (language) => language.languageCode == this,
      orElse: () => Language.english,
    );
  }

  Language fromName() {
    return Language.values.firstWhere(
      (language) => language.languageName == this,
      orElse: () => Language.english,
    );
  }
}
