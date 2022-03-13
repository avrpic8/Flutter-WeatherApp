import 'dart:convert';

class DirectGeocoding {
  DirectGeocoding({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  final String? name;
  final LocalNames? localNames;
  final double? lat;
  final double? lon;
  final String? country;
  final String? state;

  factory DirectGeocoding.fromJson(String str) =>
      DirectGeocoding.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DirectGeocoding.fromMap(Map<String, dynamic> json) => DirectGeocoding(
        name: json["name"],
        localNames: json['local_names'] == null
            ? null
            : LocalNames.fromMap(json["local_names"]),
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        country: json["country"],
        state: json["state"] == null ? null : json["state"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "local_names": localNames!.toMap(),
        "lat": lat,
        "lon": lon,
        "country": country,
        "state": state,
      };
}

class LocalNames {
  LocalNames({
    this.he,
    this.ca,
    this.fi,
    this.fa,
    this.it,
    this.es,
    this.ar,
    this.ku,
    this.pl,
    this.uk,
    this.hi,
    this.ko,
    this.kn,
    this.cs,
    this.da,
    this.de,
    this.tr,
    this.en,
    this.pt,
    this.ja,
    this.lt,
    this.ru,
    this.et,
    this.fr,
    this.ml,
    this.nl,
  });

  final String? he;
  final String? ca;
  final String? fi;
  final String? fa;
  final String? it;
  final String? es;
  final String? ar;
  final String? ku;
  final String? pl;
  final String? uk;
  final String? hi;
  final String? ko;
  final String? kn;
  final String? cs;
  final String? da;
  final String? de;
  final String? tr;
  final String? en;
  final String? pt;
  final String? ja;
  final String? lt;
  final String? ru;
  final String? et;
  final String? fr;
  final String? ml;
  final String? nl;

  factory LocalNames.fromJson(String str) =>
      LocalNames.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalNames.fromMap(Map<String, dynamic> json) => LocalNames(
        he: json["he"],
        ca: json["ca"],
        fi: json["fi"],
        fa: json["fa"],
        it: json["it"],
        es: json["es"],
        ar: json["ar"],
        ku: json["ku"],
        pl: json["pl"],
        uk: json["uk"],
        hi: json["hi"],
        ko: json["ko"],
        kn: json["kn"],
        cs: json["cs"],
        da: json["da"],
        de: json["de"],
        tr: json["tr"],
        en: json["en"],
        pt: json["pt"],
        ja: json["ja"],
        lt: json["lt"],
        ru: json["ru"],
        et: json["et"],
        fr: json["fr"],
        ml: json["ml"],
        nl: json["nl"],
      );

  Map<String, dynamic> toMap() => {
        "he": he,
        "ca": ca,
        "fi": fi,
        "fa": fa,
        "it": it,
        "es": es,
        "ar": ar,
        "ku": ku,
        "pl": pl,
        "uk": uk,
        "hi": hi,
        "ko": ko,
        "kn": kn,
        "cs": cs,
        "da": da,
        "de": de,
        "tr": tr,
        "en": en,
        "pt": pt,
        "ja": ja,
        "lt": lt,
        "ru": ru,
        "et": et,
        "fr": fr,
        "ml": ml,
        "nl": nl,
      };
}
