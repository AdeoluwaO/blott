class AppValidators {
  static final RegExp _webUrlsPattern = RegExp(
      r'(?<=\s|^)(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?\/[a-zA-Z0-9]{2,}|((https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?)|(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?',
      caseSensitive: false);

  static final _emailPattern = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
    r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
    r"[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
    r"[a-zA-Z0-9])?)+$",
  );
  static final _passwordPattern =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

  static final RegExp _minLength = RegExp(r'^.{8,}$');
  static final RegExp _hasNumber = RegExp(r'[0-9]');
  static final RegExp _hasSymbol = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  static Validator notEmpty() {
    return (String? value) {
      return (value?.isEmpty ?? true) ? "This field can not be empty." : null;
    };
  }

  static Validator confirmPass({required String password}) {
    return (String? value) {
      if (value != password) {
        return "Passwords do not match";
      } else {
        return null;
      }
    };
  }

  static Validator phone() {
    return (String? value) {
      final validPhoneNumber = RegExp(
          r'^(\+\d{1,3})[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{3}$|^[0-9]{11}$|^(\+\d{1,3})?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$');

      return (validPhoneNumber.hasMatch(value!)) ? null : "Invalid phone.";
    };
  }

  static Validator date() {
    return (String? value) {
      if (value!.isEmpty) {
        return null;
      }
      if (value.length < 10) {
        return "Invalid date.";
      }
      return null;
    };
  }

  static Validator name() {
    return (String? value) {
      if (value!.isEmpty) {
        return "Field cannot be empty.";
      }
      if (!value.contains(" ")) {
        return "Seperate names with spaces";
      }
      return null;
    };
  }

  static Validator accountNumber() {
    return (String? value) {
      return (value!.length < 10) ? "Invalid account number." : null;
    };
  }

  static Validator minLength(int minLength) {
    return (String? value) {
      if ((value?.length ?? 0) < minLength) {
        return "Must contain a minimum of $minLength characters.";
      }
      return null;
    };
  }

  static Validator maxLength(int maxLength) {
    return (String? value) {
      if ((value?.length ?? 0) != maxLength) {
        return "Must contain a total of $maxLength characters.";
      }
      return null;
    };
  }

  static bool isValid(String pin, String pin2) =>
      (pin.isNotEmpty && pin2.isNotEmpty && pin == pin2);

  static Validator matchPattern(Pattern pattern, [String? patternName]) {
    return (String? value) {
      if (value == null || (pattern.allMatches(value).isEmpty)) {
        return "Please enter a valid ${patternName ?? "value"}.";
      }
      return null;
    };
  }

  static valuesMatch({required String? compareValue, String? message}) {
    return (String? value) {
      if (value != compareValue) {
        return message ?? "Values do not match";
      } else {
        return null;
      }
    };
  }

  static Validator email() {
    return matchPattern(_emailPattern, "email");
  }

  static Validator password() {
    return matchPattern(_passwordPattern, "password");
  }

  static bool? matches(String? value, Pattern pattern) {
    //MANUAL VALIDATION WITHOUT FLUTTER TEXT FIELD VALIDATOR
    if (value == null || (pattern.allMatches(value).isEmpty)) {
      return false;
    } else {
      return true;
    }
  }

  static passwordMinLength(String? value) {
    return matches(value, _minLength);
  }

  static passwordHasNumber(String? value) {
    return matches(value, _hasNumber);
  }

  static passwordHasSymbol(String? value) {
    return matches(value, _hasSymbol);
  }

  static passwordsMatch(String? value1, String? value2) {
    if ((value2 ?? "").isNotEmpty &&
        (value1 ?? "").isNotEmpty &&
        value2 == value1) {
      return true;
    } else {
      return false;
    }
  }

  ///
  /// The provided Appvalidators are applied in the order in which
  /// they're specified in the list.
  static Validator multiple(
    List<Validator> validators, {
    bool shouldTrim = true,
  }) {
    return (String? value) {
      value = shouldTrim ? value?.trim() : value;
      for (Validator validator in validators) {
        if (validator(value) != null) {
          return validator(value);
        }
      }
      return null;
    };
  }
}

typedef Validator = String? Function(String? value);
