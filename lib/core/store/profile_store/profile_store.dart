import 'dart:convert';

import 'package:blott/core/store/local_store_config.dart';
import 'package:blott/core/store/store_keys.dart';

class UserStore {
  static storeProfile(User user) async {
    final userJson = user.toJson();
    final stringUser = jsonEncode(userJson);
    await LocalStorage().storeString(key: StoreKeys.user, val: stringUser);
  }

  static Future<User?> getStoredProfile() async {
    final String? stringUser =
        await LocalStorage().getStoredString(key: StoreKeys.user);
    if (stringUser != null) {
      final decodeUser = jsonDecode(stringUser);
      final user = User.fromJson(decodeUser);
      return user;
    } else {
      return null;
    }
  }
}


class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.isLoggedIn,
  });

  final String? firstName;
  final String? lastName;
  final bool? isLoggedIn;

  User copyWith({
    String? firstName,
    String? lastName,
    bool? isLoggedIn,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json["firstName"],
      lastName: json["lastName"],
      isLoggedIn: json["isLoggedIn"],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "isLoggedIn": isLoggedIn,
      };
}
