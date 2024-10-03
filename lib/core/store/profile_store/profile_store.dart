class ProfileStorage {
  const ProfileStorage({this.hasOnboarded, this.isLoggedIn, this.isFirstTime});
  final bool? hasOnboarded, isLoggedIn, isFirstTime;

  Map<String, dynamic> toJson() {
    return {
      'playAudio': hasOnboarded,
    };
  }

  ProfileStorage copyWith({
    bool? hasOnboarded,
    bool? isLoggedIn,
    bool? isFirstTime,
  }) {
    return ProfileStorage(
      hasOnboarded: hasOnboarded ?? this.hasOnboarded,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isFirstTime: isFirstTime ?? this.isFirstTime,
    );
  }
}
