class UserEntity {
  String uid;
  String? displayName, email, phoneNumber, photoURL, refreshToken, tenanId;
  bool emailVerified, isAnonymous;
  DateTime? creationTime, lastSignInTime;

  UserEntity({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.emailVerified,
    required this.isAnonymous,
    required this.phoneNumber,
    required this.photoURL,
    required this.refreshToken,
    required this.tenanId,
    required this.creationTime,
    required this.lastSignInTime,
  });
}
