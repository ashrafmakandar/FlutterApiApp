class Countriesdata {
  Name name;
  List<String> tld;
  String cca2;
  String ccn3;
  String cca3;
  List<String> currency;
  List<String> callingCode;
  String capital;
  List<String> altSpellings;
  String relevance;
  String region;
  String subregion;
  String nativeLanguage;
  Languages languages;
  Translations translations;
  List<int> latlng;
  String demonym;
  List<String> borders;
  dynamic area;

  Countriesdata(
      {this.name,
        this.tld,
        this.cca2,
        this.ccn3,
        this.cca3,
        this.currency,
        this.callingCode,
        this.capital,
        this.altSpellings,
        this.relevance,
        this.region,
        this.subregion,
        this.nativeLanguage,
        this.languages,
        this.translations,
        this.latlng,
        this.demonym,
        this.borders,
        this.area});

  Countriesdata.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    tld = json['tld'].cast<String>();
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    currency = json['currency'].cast<String>();
    callingCode = json['callingCode'].cast<String>();
    capital = json['capital'];
    altSpellings = json['altSpellings'].cast<String>();
    relevance = json['relevance'];
    region = json['region'];
    subregion = json['subregion'];
    nativeLanguage = json['nativeLanguage'];
    languages = json['languages'] != null
        ? new Languages.fromJson(json['languages'])
        : null;
    translations = json['translations'] != null
        ? new Translations.fromJson(json['translations'])
        : null;
    latlng = json['latlng'].cast<int>();
    demonym = json['demonym'];
    borders = json['borders'].cast<String>();
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['tld'] = this.tld;
    data['cca2'] = this.cca2;
    data['ccn3'] = this.ccn3;
    data['cca3'] = this.cca3;
    data['currency'] = this.currency;
    data['callingCode'] = this.callingCode;
    data['capital'] = this.capital;
    data['altSpellings'] = this.altSpellings;
    data['relevance'] = this.relevance;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    data['nativeLanguage'] = this.nativeLanguage;
    if (this.languages != null) {
      data['languages'] = this.languages.toJson();
    }
    if (this.translations != null) {
      data['translations'] = this.translations.toJson();
    }
    data['latlng'] = this.latlng;
    data['demonym'] = this.demonym;
    data['borders'] = this.borders;
    data['area'] = this.area;
    return data;
  }
}

class Name {
  String common;
  String official;
  Native native;

  Name({this.common, this.official, this.native});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    native =
    json['native'] != null ? new Native.fromJson(json['native']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['common'] = this.common;
    data['official'] = this.official;
    if (this.native != null) {
      data['native'] = this.native.toJson();
    }
    return data;
  }
}

class Native {
  String common;
  String official;

  Native({this.common, this.official});

  Native.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['common'] = this.common;
    data['official'] = this.official;
    return data;
  }
}

class Languages {
  String prs;
  String pus;
  String tuk;

  Languages({this.prs, this.pus, this.tuk});

  Languages.fromJson(Map<String, dynamic> json) {
    prs = json['prs'];
    pus = json['pus'];
    tuk = json['tuk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prs'] = this.prs;
    data['pus'] = this.pus;
    data['tuk'] = this.tuk;
    return data;
  }
}

class Translations {
  String cym;
  String deu;
  String fra;
  String hrv;
  String ita;
  String jpn;
  String nld;
  String por;
  String rus;
  String spa;

  Translations(
      {this.cym,
        this.deu,
        this.fra,
        this.hrv,
        this.ita,
        this.jpn,
        this.nld,
        this.por,
        this.rus,
        this.spa});

  Translations.fromJson(Map<String, dynamic> json) {
    cym = json['cym'];
    deu = json['deu'];
    fra = json['fra'];
    hrv = json['hrv'];
    ita = json['ita'];
    jpn = json['jpn'];
    nld = json['nld'];
    por = json['por'];
    rus = json['rus'];
    spa = json['spa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cym'] = this.cym;
    data['deu'] = this.deu;
    data['fra'] = this.fra;
    data['hrv'] = this.hrv;
    data['ita'] = this.ita;
    data['jpn'] = this.jpn;
    data['nld'] = this.nld;
    data['por'] = this.por;
    data['rus'] = this.rus;
    data['spa'] = this.spa;
    return data;
  }
}