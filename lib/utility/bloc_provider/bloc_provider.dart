import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_commerce/data/services/shopping_repo.dart';
import 'package:ihun_commerce/logic/authenticate/sign_in_bloc/sign_in_bloc.dart';
import 'package:ihun_commerce/logic/authenticate/sign_up_bloc/sign_up_bloc.dart';
import 'package:ihun_commerce/logic/cart_bloc/cart_bloc.dart';
import 'package:ihun_commerce/logic/products_bloc/products_bloc.dart';

final shoppingRepository = ShoppingRepository();

class AppBlocProvider {
  static get allBlocProvider => [
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc()
            ..add(
              LoadListProducts(),
            ),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        ),
      ];
}
