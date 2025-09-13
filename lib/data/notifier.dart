import 'package:flutter/material.dart';

ValueNotifier<String> genderValueNotifier = ValueNotifier("Null");

ValueNotifier<List<ValueNotifier<double>>> weightAndAgeValueNotifier =
    ValueNotifier([ValueNotifier(60), ValueNotifier(20)]); // Weight - Age

ValueNotifier<double> heightValueNotifier = ValueNotifier(100);
