import 'package:flutter/cupertino.dart';

String? Function(String?)? emailSignInValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'Email ID cannot be empty';
    }
  };
}

String? Function(String?)? passwordSignInValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'Password cannot be empty';
    }
  };
}

String specialPattern = r'^(?=.*[!#$%&? "@]).{8,20}$';
String alphaPattern = r'[a-zA-Z ]*$';
RegExp specialRegExp = new RegExp(specialPattern);
RegExp alphaRegExp = new RegExp(alphaPattern);
String? Function(String?)? passwordSignUpValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length <= 8) {
      return 'Password should be at least 8 characters';
    } else if (value.length > 20) {
      return 'Password should not exceed 20 characters';
    } else if (!specialRegExp.hasMatch(value)) {
      return 'Password should contain special characters';
    } else {
      return null;
    }
  };
}
String? Function(String?)? confirmPasswordSignUpValidator(
    TextEditingController password) {
  return (String? value) {
    if (value!.isEmpty) {
      return 'Confirm Password cannot be empty';
    }
    if (value != password.text) {
      return 'Passwords do not Match';
    }
  };
}

String? Function(String?)? checkSignUpValidator() {
  return (String? value) {};
}

String? Function(String?)? firstNameSignUpValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'FirstName cannot be empty';
    }else if ((value.length <= 2) || (value.length > 20)) {
			return 'FirstName should be between 2 and 20 characters';
		}
		else if (!alphaRegExp.hasMatch(value)) {	
			return 'only characters are allowed in FirstName';
		}else{
	return null;
		}
  };
}

String? Function(String?)? lastNameSignUpValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'LastName cannot be empty';
    }else if ((value.length <= 2) || (value.length > 20)) {
			return 'LastName should be between 2 and 20 characters';
		}
		else if (!alphaRegExp.hasMatch(value)) {	
			return 'only characters are allowed in LastName';
		}else{
	return null;
		}
  };
}

String? Function(String?)? emailSignUpValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'Email ID cannot be empty';
    } else if (value.indexOf('@') <= 0) {
		return 'Email ID cannot be empty';
		}
		else if ((value[(value.length - 4)] != '.') && (value[(value.length - 3)] != '.')) {
		return 'Invalid Email ID';
		}else{
		return 'Invalid Email ID length';
		}
  };
}

String? Function(String?)? mobileNumberSignUpValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'Email ID cannot be empty';
    } else if (value.indexOf('@') <= 0) {
		return 'Email ID cannot be empty';
		}
		else if ((value[(value.length - 4)] != '.') && (value[(value.length - 3)] != '.')) {
		return 'Invalid Email ID';
		}else{
		return 'Invalid Email ID length';
		}
  };
}

String? Function(String?)? mcitySignUpValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'City cannot be empty';
    }
	else{
		return 'Invalid Email ID length';
		}
  };
}