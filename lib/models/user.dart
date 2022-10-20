class User {
  String? uid;
  String? userName;
  String? age;

  User({this.uid, this.userName, this.age});

  User.fromJson(Map json)
      : uid = json["uid"],
        userName = json["userName"],
        age = json["age"];

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "userName": userName,
        "age": age,
      };
}
