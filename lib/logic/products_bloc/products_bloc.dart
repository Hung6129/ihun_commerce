import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ihun_commerce/data/models/product.dart';
import 'package:ihun_commerce/data/services/api_provider.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<LoadListProducts>((event, emit) async {
      emit(ProductsLoading());
      try {
        final listProduct = await ApiProvider().fetchListProducts();
        emit(ProductsLoaded(listProduct: listProduct));
      } catch (e) {
        emit(ProductsError(err: e.toString()));
      }
    });
  }
}
