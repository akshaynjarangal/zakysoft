import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/sub_categories_model.dart';
import '../services/sub_categories_service.dart';

class SubCategoriesProvider extends ChangeNotifier with EquatableMixin{
  ///
  /// getter [loading] for Handle Loading state
  /// 
  bool _loading = false;
  bool get loading => _loading;
  set setLoading(bool val) => _loading = val;

  ///
  /// getter & setter for [subCategoriesModel] & [setSubCategoriesModel] 
  /// 
  List<SubCategoriesModel> _subCategoriesModel= [];
  List<SubCategoriesModel> get subCategoriesModel => _subCategoriesModel;
  set setSubCategoriesModel(List<SubCategoriesModel> subcategories) => _subCategoriesModel = subcategories;
  
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


  Future<void> getAllSubCategories({required String parentId}) async {
    setLoading = true;
    notifyListeners();
    final response = await SubCategoriesService.getSubCategories(parentId);
      response.fold((failure) {
      setError = true;
      setLoading = false;
      notifyListeners();
    }, (success) {      
      setSubCategoriesModel = subCategoriesModelFromJson(success.body);
      _subCategoriesModel.insert(0, const SubCategoriesModel(id: 0,name: 'All'));
      setLoading = false;
      setSuccess = true;
      setError = false;
      notifyListeners();
    });
  }

  @override
  List<Object?> get props => [loading, subCategoriesModel, isError, isSuccess];
}