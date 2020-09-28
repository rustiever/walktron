import 'package:meta/meta.dart';

class UserModel {
  UserModel(
      {@required this.name,
      @required this.uid,
      @required this.height,
      @required this.weight,
      @required this.age});

  String name;
  String uid;
  String height;
  String weight;
  int age;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] == null ? null : json["name"] as String,
        uid: json["uid"] == null ? null : json["uid"] as String,
        height: json["height"] == '0.0' ? null : json["height"] as String,
        weight: json["weight"] == '0.0' ? null : json["weight"] as String,
        age: json["age"] == null ? 0 : json["age"] as int,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "height": height,
        "weight": weight,
        "age": age,
      };
}
