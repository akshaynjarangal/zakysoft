import 'package:equatable/equatable.dart';
import 'package:faralah/src/constants/enums.dart';
import 'package:faralah/src/data/models/product_list_model.dart';
import 'package:faralah/src/data/services/product_list_service.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier with EquatableMixin {
  ///
  /// getter [loading] for Handle Loading state
  ///
  bool _loading = false;
  bool get loading => _loading;
  set setLoading(bool val) => _loading = val;
  bool _ishasMore = true;
  bool get hasMore=> _ishasMore;
  set setIsHasMore(bool val)=>_ishasMore =val;
  ///
  /// getter & setter for [productsListModel] & [setProductsListModel]
  ///
  List<ProductsListModel> productsListModel = <ProductsListModel>[];
  List<ProductsListModel> get productsModel => productsListModel;
  set setProductsListModel(List<ProductsListModel> products) {
    productsListModel = products;
    if(products.length<20){
      setIsHasMore = false;
      notifyListeners();
    }
    else{
      setIsHasMore = true;
      notifyListeners();
    }
  }
  set setInfiniteProductsListModel(List<ProductsListModel> products) {
    if(products.length<20){
      setIsHasMore = false;
      notifyListeners();
    }
    productsListModel.addAll(products);
  }
  set clearList(List<ProductsListModel> products) {
    productsListModel.clear();
    notifyListeners();
  }
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

  bool _isEmpty = false;
  bool get isEmpty => _isEmpty;
  set setEmptyStatus(bool status)=> _isEmpty = status;

  int _offsetValue = 0;
  int get offsetValue => _offsetValue;
  set setOffsetValue(int value) => _offsetValue = value;
  Future<void> getAllProducts(
      {required String parentId, required String categoryId,String? offset}) async {
    setLoading = true;
    notifyListeners();
    final response = await ProductListService.getProducts(
        parentId: parentId, categoryId: categoryId, offset: '${offset??offsetValue}');
    response.fold((failure) {
      if (failure == MainFailures.noContentFailure) {
        setProductsListModel = [];
        setLoading = false;
        notifyListeners();
      } else {
        setError = true;
        setLoading = false;
        notifyListeners();
      }
    }, (success) {
      setProductsListModel = productsListModelFromJson(success.body);
      setLoading = false;
      setSuccess = true;
      setError = false;
      setOffsetValue =0;
      setOffsetValue = 20;
      notifyListeners();
    });
  }

  Future<void> getInfiniteProducts(
      {required String parentId, required String categoryId}) async {
    final response = await ProductListService.getProducts(
        parentId: parentId, categoryId: categoryId, offset: '$offsetValue');
    response.fold((failure) {
      if (failure == MainFailures.noContentFailure) {
        setInfiniteProductsListModel = [];
        setLoading = false;
        notifyListeners();
      } else {
        setError = true;
        setLoading = false;
        notifyListeners();
      }
    }, (success) {
      setInfiniteProductsListModel = productsListModelFromJson(success.body);
      
      setLoading = false;
      setSuccess = true;
      setError = false;
      setOffsetValue = offsetValue+20;
      notifyListeners();
    });
  }

  @override
  List<Object?> get props => [loading, productsListModel, isError, isSuccess];
}
