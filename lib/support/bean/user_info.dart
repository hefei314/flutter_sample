///
/// author: hefei
/// time  : 2020/10/23
/// desc  :
///
class UserInfo {
  String userId;
  String userName;

  UserInfo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        userName = json['userName'];

  Map<String, dynamic> toJson() =>
      {
        'userId': userId,
        'userName': userName,
      };
}
