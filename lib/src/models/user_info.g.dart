// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoAdapter extends TypeAdapter<UserInfo> {
  @override
  final int typeId = 1;

  @override
  UserInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfo();
  }

  @override
  void write(BinaryWriter writer, UserInfo obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      adderss: json['adderss'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phoneNo'] as String?,
      appCode: json['appCode'] as String?,
      appName: json['appName'] as String?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'userName': instance.userName,
      'fullName': instance.fullName,
      'adderss': instance.adderss,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'appCode': instance.appCode,
      'appName': instance.appName,
    };
