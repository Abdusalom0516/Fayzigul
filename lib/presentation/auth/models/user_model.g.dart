// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      emailVerified: json['emailVerified'] as bool,
      isAnonymous: json['isAnonymous'] as bool,
      phoneNumber: json['phoneNumber'] as bool,
      photoURL: json['photoURL'] as bool,
      refreshToken: json['refreshToken'] as bool,
      tenanId: json['tenanId'] as bool,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastSignInTime: json['lastSignInTime'] == null
          ? null
          : DateTime.parse(json['lastSignInTime'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'isAnonymous': instance.isAnonymous,
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoURL,
      'refreshToken': instance.refreshToken,
      'tenanId': instance.tenanId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastSignInTime': instance.lastSignInTime?.toIso8601String(),
    };
