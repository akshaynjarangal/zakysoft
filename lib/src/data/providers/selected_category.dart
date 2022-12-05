import 'dart:developer';
import 'package:flutter/material.dart';

class SelectedCategoryProvider extends ChangeNotifier{
  int? _selectedCat;

  int? get selectedCat=> _selectedCat;
  set changeCatId(int catid){
    _selectedCat = catid;
    log(selectedCat.toString());
    notifyListeners();
  }
}