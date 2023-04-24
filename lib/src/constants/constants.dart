import 'dart:io';

import 'package:dartz/dartz.dart';
import 'enums.dart';
import 'package:http/http.dart' as http;
class AppUrls{
  static String host = 'sta.farawlah.sa';
  static String basePath = 'api/mobile';
  static String categoriesEnpoint = '$basePath/categories';
  static String subCategoriesEndpoint = '$basePath/subcategories';
  static String productsEndpoint = '$basePath/products';
}
final client = http.Client();

class ErrorHandlers{
/*
 ------------------------- HTTP RESPONSE HANDLER -----------------------
*/
 static Either<MainFailures, http.Response> httpHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return Right(response);
      case 204: 
        return const Left(MainFailures.noContentFailure);
      default : 
        return const Left(MainFailures.serverFailure);
    }
  }


/*
 ------------------------- HTTP EXCEPTION HANDLER -----------------------
*/
 static Either<MainFailures, http.Response> exceptionHandler(Object exception) {
    switch (exception) {
      case SocketException:
        return const Left(MainFailures.noInternetFailure);
      case FormatException:
        return const Left(MainFailures.formatExceptionFailure);
      default: 
        return const Left(MainFailures.serverFailure);
    }
  }
}