import 'package:dartz/dartz.dart';

import '../../constants/constants.dart';
import '../../constants/enums.dart';
import 'package:http/http.dart' as http;

class SubCategoriesService {
  static Future<Either<MainFailures,http.Response>> getSubCategories(String parentId) async {
   try {
      final url = Uri.https(AppUrls.host, AppUrls.subCategoriesEndpoint,{
        "parent_id":parentId
      });
      final response = await client.get(url);
      return ErrorHandlers.httpHandler(response);
    } catch (exception) {
      return ErrorHandlers.exceptionHandler(exception);
    }
  }
}