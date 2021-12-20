import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  double _height = 170;
  double get height => _height;

  bool _isMaleselected = true;
  bool get isMaleselected => _isMaleselected;

  double _weight = 80;
  double get weight => _weight;

  int _age = 28;
  int get age => _age;

  double get result => _weight / pow(height / 100, 2);

  onchangeSliderValue(double value) {
    _height = value;
    update();
  }

  onchangeWeight(bool isincrement) {
    isincrement ? _weight++ : _weight--;
    update();
  }

  onchangeAge(bool isincrement) {
    isincrement ? _age++ : _age--;
    update();
  }

  onChangeselectedMale() {
    _isMaleselected = !_isMaleselected;
    update();
  }
}
