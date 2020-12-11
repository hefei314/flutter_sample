///
/// author: hefei
/// time  : 2020/10/26
/// desc  :
///
class SplashBean {
  SplashBean({this.title, this.content, this.url, this.imgUrl});

  String title;
  String content;
  String url;
  String imgUrl;

  SplashBean.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        url = json['url'],
        imgUrl = json['imgUrl'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'url': url,
        'imgUrl': imgUrl,
      };
}
