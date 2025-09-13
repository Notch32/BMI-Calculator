import 'package:flutter/material.dart';

ValueNotifier<String> genderValueNotifier = ValueNotifier("Null");

ValueNotifier<List<ValueNotifier<int>>> weightAndAgeValueNotifier =
    ValueNotifier([ValueNotifier(60), ValueNotifier(20)]); // Weight - Age

ValueNotifier<int> heightValueNotifier = ValueNotifier(100);
