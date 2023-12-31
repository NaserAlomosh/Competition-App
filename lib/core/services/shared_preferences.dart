// ignore_for_file: avoid_print

import 'package:final_project/core/services/encrypt.dart';

import '../../main.dart';

setSharedPreferences(String key, String? value) async {
  if (value != '') {
    String text = EncryptData().encrypt(value!);
    bool? saveData = await prefs!.setString(key, text);
    print('Set Data In SharedPreferences $key : $saveData');
  } else {
    bool? saveData = await prefs!.setString(key, '');
    print('Set Data In SharedPreferences $key : $saveData');
  }
}

String getSharedPreferences(String key) {
  String? data = prefs!.getString(key);
  if (data != '') {
    String text = EncryptData().decrypt(data!);
    print('Get Data From SharedPreferences $key = $text');
    return text;
  } else {
    print('Get Data From SharedPreferences $key = $data');
    return data!;
  }
}

Future<bool> clearSharedPreferences() async {
  bool clean = await prefs!.clear();
  print('Clear Shared Preferences : $clean');
  return clean;
}
