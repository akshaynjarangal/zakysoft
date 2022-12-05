import 'dart:developer';
import 'package:flutter/material.dart';

class SelectedSubCategoryProvider extends ChangeNotifier{
  int? _selectedSubCat;

  int? get selectedSubCat=> _selectedSubCat;
  set changeSubCatId(int? catid){
    _selectedSubCat = catid;
    log(selectedSubCat.toString());
    notifyListeners();
  }
}