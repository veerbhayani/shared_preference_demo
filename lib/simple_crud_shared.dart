import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleCrudSharedPref {
  var fName = '', mName = '', lName = '';
  static var userDetails = [];
  static var firstNameController = TextEditingController();
  static var middleNameController = TextEditingController();
  static var lastNameController = TextEditingController();
  static Future<void> setValue() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(SharedKey.firstName, firstNameController.text);
    pref.setString(SharedKey.middleName, middleNameController.text);
    pref.setString(SharedKey.lastName, lastNameController.text);
  }
}

class SharedKey {
  static var firstName = 'name';
  static var middleName = 'middleName';
  static var lastName = 'lastName';
}
