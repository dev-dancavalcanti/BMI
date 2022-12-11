import 'package:bmi/repository/shared_repository.dart';
import 'package:flutter/material.dart';
import '../shared/models/person_model.dart';

enum Gender { male, female }

class BmiController extends ChangeNotifier {
  final SharedRepository _prefs;
  BmiController(this._prefs) {
    initialize();
  }
//Text name

  TextEditingController nameController = TextEditingController();
  TextEditingController editController = TextEditingController();

  // Select Gender
  Gender? genderSelect;
  late bool selectGender;

  // BMI Calculate
  double _altura = 1.2;
  int _peso = 0;
  bool isVisible = false;
  double value = 1.2;

  void setAltura(double value) => _altura = value;
  void setPeso(String value) => _peso = int.tryParse(value) ?? 0;

  Map<String, dynamic> result = {};
  var progress = 0.0;

  Future<void> calculateBmi() async {
    final bmiValue =
        Person(altura: _altura, peso: _peso, name: nameController.text)
            .getImc();
    final bmiText = bmiValue.toStringAsFixed(1);

    try {
      if (bmiValue < 18.5) {
        result = {
          'result': bmiText,
          'progress': bmiValue,
          'body': 'Underweight',
        };
      } else if (bmiValue >= 18.5 && bmiValue < 25) {
        result = {
          'result': bmiText,
          'progress': bmiValue,
          'body': 'Normal',
        };
      } else if (bmiValue >= 25 && bmiValue < 30) {
        result = {
          'result': bmiText,
          'progress': bmiValue,
          'body': 'Overweight',
        };
      } else if (bmiValue >= 30) {
        result = {
          'result': bmiText,
          'progress': bmiValue,
          'body': 'Obesity',
        };
      }
    } on Exception {
      ('Nao foi possivel');
    } catch (e) {
      ('Nao foi possivel');
    }
    notifyListeners();
  }

  // SharedPreference BMI

  late PersonModel listBMI;
  bool isLoading = false;
  bool listInitialize = true;

  Future<void> toggleLoading() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> initialize() async {
    toggleLoading();
    listBMI = await _prefs.initialize();
    toggleLoading();
  }

  Future<void> saveBMI() async {
    await toggleLoading();
    listBMI.person.add(Person(
        body: result["body"],
        bmi: result["result"],
        name: nameController.text,
        altura: double.tryParse(_altura.toStringAsFixed(2))!,
        peso: _peso,
        idade: int.tryParse(ageController.text),
        genero: selectGender));
    await _prefs.updateData(listBMI);
    await toggleLoading();
    nameController.clear();
  }

  Future<void> deletedHistory(int index) async {
    await toggleLoading();
    listBMI.person.removeAt(index);
    await _prefs.updateData(listBMI);
    await toggleLoading();
  }

  // Add and Remove (Age or Weight)

  void clearValues() {
    genderSelect = null;
    value = 1.2;
    setAltura(1.2);
    setPeso('0');
    weightController = TextEditingController(text: '0');
    ageController = TextEditingController(text: '18');
  }

  TextEditingController ageController = TextEditingController(text: '18');
  TextEditingController weightController = TextEditingController(text: '0');

  void incrementedValue() {
    var add = _peso;
    add++;
    _peso = int.parse(weightController.text);
    weightController.text = add.toString();

    notifyListeners();
  }

  void decrementedValue() {
    var remove = _peso;
    remove--;
    if (remove <= 0) {
      remove = 0;
    }
    _peso = int.parse(weightController.text);
    weightController.text = remove.toString();

    notifyListeners();
  }

  void incrementedAgeValue() {
    var add = int.parse(ageController.text);
    add++;
    if (add >= 50) {
      add = 50;
    }
    ageController.text = add.toString();
    notifyListeners();
  }

  void decrementedAgeValue() {
    var remove = int.parse(ageController.text);
    remove--;
    if (remove <= 18) {
      remove = 18;
    }
    ageController.text = remove.toString();
    notifyListeners();
  }
}
