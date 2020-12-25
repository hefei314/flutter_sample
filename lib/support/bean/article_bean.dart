///
/// author: hefei
/// time  : 2020/11/05
/// desc  :
///
class ArticleBean {
  ArticleBean({
    this.id,
    this.author,
    this.category,
    this.createdAt,
    this.desc,
    this.images,
    this.likeCounts,
    this.publishedAt,
    this.stars,
    this.title,
    this.type,
    this.url,
    this.views,
  });

  String id;
  String author;
  String category;
  DateTime createdAt;
  String desc;
  List<String> images;
  int likeCounts;
  DateTime publishedAt;
  int stars;
  String title;
  String type;
  String url;
  int views;

  factory ArticleBean.fromJson(Map<String, dynamic> json) => ArticleBean(
        id: json["_id"],
        author: json["author"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        desc: json["desc"],
        images: List<String>.from(json["images"].map((x) => x)),
        likeCounts: json["likeCounts"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        stars: json["stars"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "desc": desc,
        "images": List<dynamic>.from(images.map((x) => x)),
        "likeCounts": likeCounts,
        "publishedAt": publishedAt.toIso8601String(),
        "stars": stars,
        "title": title,
        "type": type,
        "url": url,
        "views": views,
      };
}
