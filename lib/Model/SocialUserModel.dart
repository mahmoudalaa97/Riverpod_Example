// To parse this JSON data, do
//
//     final socialUserModel = socialUserModelFromJson(jsonString);

import 'dart:convert';

SocialUserModel socialUserModelFromJson(String str) => SocialUserModel.fromJson(json.decode(str));

String socialUserModelToJson(SocialUserModel data) => json.encode(data.toJson());

class SocialUserModel {
  SocialUserModel({
    this.fullname,
    this.username,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.provider,
    this.uid,
  });

  final String fullname;
  final String username;
  final String email;
  final String phoneNumber;
  final String photoUrl;
  final String provider;
  final String uid;

  SocialUserModel copyWith({
    String fullname,
    String username,
    String email,
    String phoneNumber,
    String photoUrl,
    String provider,
    String uid,
  }) =>
      SocialUserModel(
        fullname: fullname ?? this.fullname,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoUrl: photoUrl ?? this.photoUrl,
        provider: provider ?? this.provider,
        uid: uid ?? this.uid,
      );

  factory SocialUserModel.fromJson(Map<String, dynamic> json) => SocialUserModel(
    fullname: json["fullname"] == null ? null : json["fullname"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    photoUrl: json[" photoURL"] == null ? null : json[" photoURL"],
    provider: json["provider"] == null ? null : json["provider"],
    uid: json["uid"] == null ? null : json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "fullname": fullname == null ? null : fullname,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    " photoURL": photoUrl == null ? null : photoUrl,
    "provider": provider == null ? null : provider,
    "uid": uid == null ? null : uid,
  };
}
