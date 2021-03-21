import 'package:flutter/cupertino.dart';

class ValidationRequiredValues {
  TextEditingController password;
  ValidationRequiredValues(this.password);
}
String? Function(String?)? emailValidator = (String? value){
        if(value!.isEmpty){
          return 'EmailID cannot be empty';
        }
  };
     String? Function(String?)? passwordValidator = (String? value){
        if(value!.isEmpty){
          return 'Password cannot be empty';
        }
  };
  
   String? Function(String?)? confirmPasswordValidator(TextEditingController password){
     return (String? value){
        if(value!.isEmpty){
          return 'Confirm Password cannot be empty';
        }
          if(value != password.text){
                                   return 'Passwords do not Match';
              }
  };}