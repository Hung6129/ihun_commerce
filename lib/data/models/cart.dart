import 'package:equatable/equatable.dart';
import 'package:ihun_commerce/data/models/product.dart';

class Cart extends Equatable {
  const Cart({this.items = const <Product>[]});

  final List<Product> items;

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price!.toInt());
  }

  @override
  List<Object> get props => [items];
}
