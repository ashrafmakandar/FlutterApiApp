class Repositorys {
  String author;
  String name;
  String avatar;
  String url;
  String description;
  String language;
  String languageColor;
  int stars;
  int forks;
  int currentPeriodStars;
  List<BuiltBy> builtBy;

  Repositorys(
      {this.author,
        this.name,
        this.avatar,
        this.url,
        this.description,
        this.language,
        this.languageColor,
        this.stars,
        this.forks,
        this.currentPeriodStars,
        this.builtBy});

  Repositorys.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    name = json['name'];
    avatar = json['avatar'];
    url = json['url'];
    description = json['description'];
    language = json['language'];
    languageColor = json['languageColor'];
    stars = json['stars'];
    forks = json['forks'];
    currentPeriodStars = json['currentPeriodStars'];
    if (json['builtBy'] != null) {
      builtBy = new List<BuiltBy>();
      json['builtBy'].forEach((v) {
        builtBy.add(new BuiltBy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['url'] = this.url;
    data['description'] = this.description;
    data['language'] = this.language;
    data['languageColor'] = this.languageColor;
    data['stars'] = this.stars;
    data['forks'] = this.forks;
    data['currentPeriodStars'] = this.currentPeriodStars;
    if (this.builtBy != null) {
      data['builtBy'] = this.builtBy.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BuiltBy {
  String href;
  String avatar;
  String username;

  BuiltBy({this.href, this.avatar, this.username});

  BuiltBy.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    avatar = json['avatar'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['avatar'] = this.avatar;
    data['username'] = this.username;
    return data;
  }
}
class Repos {
  String author;
  String name;
  String avatar;
  String url;
  String description;
  String language;
  String languageColor;
  int stars;
  int forks;
  int currentPeriodStars;
  List<BuiltBy> builtBy;

  Repos(
      {this.author,
        this.name,
        this.avatar,
        this.url,
        this.description,
        this.language,
        this.languageColor,
        this.stars,
        this.forks,
        this.currentPeriodStars,
        this.builtBy});

  Repos.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    name = json['name'];
    avatar = json['avatar'];
    url = json['url'];
    description = json['description'];
    language = json['language'];
    languageColor = json['languageColor'];
    stars = json['stars'];
    forks = json['forks'];
    currentPeriodStars = json['currentPeriodStars'];
    if (json['builtBy'] != null) {
      builtBy = new List<BuiltBy>();
      json['builtBy'].forEach((v) {
        builtBy.add(new BuiltBy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['url'] = this.url;
    data['description'] = this.description;
    data['language'] = this.language;
    data['languageColor'] = this.languageColor;
    data['stars'] = this.stars;
    data['forks'] = this.forks;
    data['currentPeriodStars'] = this.currentPeriodStars;
    if (this.builtBy != null) {
      data['builtBy'] = this.builtBy.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



