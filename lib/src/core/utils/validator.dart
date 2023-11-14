import 'package:target/constants.dart';
import 'package:target/src/core/utils/validator_utils.dart';

mixin class Validator {
  String? userValidate(String? text) {
    if (text!.isEmpty) {
      return 'The User field cannot be empty.';
    }
    if (text.length > 20) {
      return 'The User field cannot be longer than 20 characters.';
    }
    if (text.isValidUser() == true) {
      return 'The User field must not contain any special characters.';
    }
    // if (text != users[0].name &&
    //     text != users[0].email &&
    //     text != users[1].name &&
    //     text != users[1].email) {
    //   return 'The User field must be a valid email or name.';
    // }

    return null;
  }

  String? passwordValidate(String? text) {
    if (text!.isEmpty) {
      return 'The Password field cannot be empty.';
    }
    if (text.isValidPassword() == false) {
      return 'The Password must not contain any special characters.';
    }
    if (text.length < 2 || text.length > 20) {
      return 'The password must be a minimum of 2 characters\n and a maximum of 20.';
    }
    // if (text != users[0].password && text != users[1].password) {
    //   return 'The Password field must be a valid password.';
    // }

    return null;
  }

  String? fieldIsNotEmpty(String? text) {
    if (text!.isEmpty) {
      return 'The Information field cannot be empty.';
    }
    return null;
  }
}
