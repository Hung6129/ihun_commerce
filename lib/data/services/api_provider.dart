import 'package:dio/dio.dart';
import 'package:ihun_commerce/data/models/product.dart';

class ApiProvider {
  ApiProvider._();
  static final instance = ApiProvider._();

  final Dio _dio = Dio();
  final String url = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchListProducts() async {
    _dio.options.connectTimeout = const Duration(seconds: 5);
    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          "id": 1,
          "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          "price": 109.95,
          "description":
              "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          "category": "men's clothing",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {
            "rate": 3.9,
            "count": 120,
          },
        },
      );
      if (response.statusCode == 200) {
        final listFetch = response.data as List<dynamic>;
        final listData = listFetch.map((e) => Product.fromJson(e)).toList();
        return listData;
      } else {
        throw Exception('Fail to fetch data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
