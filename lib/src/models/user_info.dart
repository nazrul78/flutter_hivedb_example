import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class UserInfo {
  String? userName;
  String? fullName;
  String? adderss;
  String? email;
  String? phoneNo;
  String? appCode;
  String? appName;

  UserInfo({
    this.userName,
    this.fullName,
    this.adderss,
    this.email,
    this.phoneNo,
    this.appCode,
    this.appName,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
