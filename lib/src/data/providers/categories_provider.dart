import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../services/categories_service.dart';

class CategoriesProvider extends ChangeNotifier with EquatableMixin{
  ///
  /// getter [loading] for Handle Loading state
  /// 
  bool _loading = false;
  bool get loading => _loading;
  set setLoading(bool val) => _loading = val;

  ///
  /// getter & setter for [categoriesModel] & [setCategoriesModel] 
  /// 
  List<CategoriesModel> _categoriesModel= [];
  List<CategoriesModel> get categoriesModel => _categoriesModel;
  set setCategoriesModel(List<CategoriesModel> categories) => _categoriesModel = categories;
  /// 
  /// [isError]for Handle error state
  /// 
  bool _isError = false;
  bool get isError => _isError;
  set setError(bool error) => _isError = error;

  ///
  /// getter [isSuccess] Handle success state
  /// 
  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;
  set setSuccess(bool svalue) => _isSuccess = svalue;


  Future<void> getAllCategories() async {
    setLoading = true;
    notifyListeners();
    final response = await CategoriesService.getCategories();
      response.fold((failure) {
      setError = true;
      setLoading = false;
      notifyListeners();
    }, (success) {      
      setCategoriesModel = categoriesModelFromJson(success.body);
      _categoriesModel.insert(0, const CategoriesModel(id: 0,name: 'All'));
      setLoading = false;
      setSuccess = true;
      setError = false;
      notifyListeners();
    });
  }

  @override
  List<Object?> get props => [loading, categoriesModel, isError, isSuccess];
}