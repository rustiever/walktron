import 'package:meta/meta.dart';

class UserModel {
  UserModel({
    @required this.name,
    @required this.uid,
    @required this.height,
    @required this.weight,
  });

  String name;
  String uid;
  String height;
  String weight;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] as String,
        uid: json["uid"] as String,
        height: json["height"] as String,
        weight: json["weight"] as String,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "height": height,
        "weight": weight,
      };
}
