import 'package:dio/dio.dart';
import 'package:ihun_commerce/data/models/product.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String url = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchListProducts() async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final listFetch = response.data as List<dynamic>;
        final listData = listFetch.map((e) => Product.fromJson(e)).toList();
        return listData;
      } else {
        throw Exception('fail to fetch data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
