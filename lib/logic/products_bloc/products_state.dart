// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {}

class ProductsInitial extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsLoaded extends ProductsState {
  final List<Product> listProduct;
  ProductsLoaded({required this.listProduct});
  @override
  List<Object?> get props => [listProduct];
}

class ProductsError extends ProductsState {
  final String err;
  ProductsError({required this.err});
  @override
  List<Object?> get props => [err];
}
