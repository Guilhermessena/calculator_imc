import 'dart:math';

import 'package:flutter/material.dart';

class User {
  final String _id = UniqueKey().toString();
  double _weigth = 0.0;
  double _height = 0.0;

  User(
    this._weigth,
    this._height,
  );

  String get id => _id;

  double get weigth => _weigth;
  set weight(double weight) {
    _weigth = weight;
  }

  double get height => _height;
  set height(double height) {
    _height = height;
  }

  double calculaImc(double weight, double height) {
    return weight / pow(height, 2);
  }
}
