
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';
import '../../constants/enums.dart';

class CategoriesService {
  static Future<Either<MainFailures,http.Response>> getCategories() async {
   try {
      final url = Uri.https(AppUrls.host, AppUrls.categoriesEnpoint);
      final response = await client.get(url);
      return ErrorHandlers.httpHandler(response);
    } catch (exception) {
      return ErrorHandlers.exceptionHandler(exception);
    }
  }
}