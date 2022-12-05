import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';
import '../../constants/enums.dart';

class ProductListService {
  static Future<Either<MainFailures, http.Response>> getProducts(
      {required String parentId,
      required String categoryId,
      required String offset}) async {
    try {
      final url = Uri.https(AppUrls.host, AppUrls.productsEndpoint, {
        "parent_category_id": parentId,
        "category_id": categoryId,
        "store_id": "2",
        "offset": offset,
        "limit": "20",
        "sort_by": "sale_price",
        "sort_type": "DESC"
      });
      final response = await client.get(url);
      return ErrorHandlers.httpHandler(response);
    } catch (exception) {
      return ErrorHandlers.exceptionHandler(exception);
    }
  }
}
