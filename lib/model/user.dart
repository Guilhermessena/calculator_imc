import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String id = UniqueKey().toString();
  @HiveField(1)
  double weigth = 0.0;
  @HiveField(2)
  double height = 0.0;
  @HiveField(3)
  double imc = 0.0;

  User();

  User.vazio() {
    weigth = 0.0;
    height = 0.0;
  }

  void calculaImc(double weigth, double height) {
    imc = weigth / pow(height, 2);
  }
}
