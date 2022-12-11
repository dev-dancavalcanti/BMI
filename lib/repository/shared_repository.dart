import 'dart:convert';

import 'package:bmi/shared/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedRepository {
  late SharedPreferences _prefs;
  final String _key = "bmiList";

  Future<PersonModel> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await firstInit();
    String? prefs = _prefs.getString(_key);
    return PersonModel.fromJson(jsonDecode(prefs!));
  }

  Future<void> firstInit() async {
    if (_prefs.get(_key) == null) {
      Map<String, dynamic> bmiList = {"person": []};
      await _prefs.setString(_key, jsonEncode(bmiList));
    }
  }

  Future<void> updateData(PersonModel personList) async {
    try {
      await _prefs.setString(_key, jsonEncode(personList));
    } catch (e) {
      rethrow;
    }
  }
}
