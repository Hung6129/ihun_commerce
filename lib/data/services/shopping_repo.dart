import 'package:ihun_commerce/data/models/product.dart';

const _delay = Duration(milliseconds: 800);

class ShoppingRepository {
  final _items = <Product>[];

  Future<List<Product>> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(Product item) => _items.add(item);

  void removeItemFromCart(Product item) => _items.remove(item);
}
