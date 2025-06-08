import 'package:plant_store/presentation/auth/entities/user_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.email,
    required super.displayName,
    required super.emailVerified,
    required super.isAnonymous,
    required super.phoneNumber,
    required super.photoURL,
    required super.refreshToken,
    required super.tenanId,
    required super.creationTime,
    required super.lastSignInTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? uid,
    String? email,
    String? displayName,
    bool? emailVerified,
    bool? isAnonymous,
    String? phoneNumber,
    String? photoURL,
    String? refreshToken,
    String? tenanId,
    DateTime? creationTime,
    DateTime? lastSignInTime,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      emailVerified: emailVerified ?? this.emailVerified,
      isAnonymous: this.isAnonymous,
      phoneNumber: this.phoneNumber,
      photoURL: this.photoURL,
      refreshToken: this.refreshToken,
      tenanId: this.tenanId,
      creationTime: this.creationTime,
      lastSignInTime: this.lastSignInTime,
    );
  }
}
