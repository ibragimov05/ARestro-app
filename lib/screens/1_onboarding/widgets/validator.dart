import 'package:arestro_app/models/user_data.dart';

abstract class Validator {
  /// in progress
  static bool checkUserNameAvailable({required String userName}) {
    for (var each in userDataList) {
      if (each.userUserName == userName) {
        return false;
      }
    }
    return true;
  }

  /// function to check whether user entered valid email address using RexExp
  static bool isValidEmail({required String email}) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
  }

  /// function to check whether user entered valid phone number using RexExp
  static bool isValidPhoneNumber({required String phoneNumber}) {
    return RegExp(r'^(\+?\d{1,3}[- ]?)?(\(?\d{1,4}\)?[- ]?)?\d{7,10}$')
        .hasMatch(phoneNumber);
  }

  /// function to check whether user entered strong password using RegExp
  static bool isValidPassword({required String password}) {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_\-]).{8,}$')
        .hasMatch(password);
  }
}
