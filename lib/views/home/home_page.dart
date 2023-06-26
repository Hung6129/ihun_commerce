import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_commerce/data/models/product.dart';

import 'package:ihun_commerce/logic/cart_bloc/cart_bloc.dart';
import 'package:ihun_commerce/logic/products_bloc/products_bloc.dart';
import 'package:ihun_commerce/views/cart/cart_page.dart';
import 'package:ihun_commerce/views/detail/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return switch (state) {
                  CartLoading() => const CircularProgressIndicator(),
                  CartError() => const Icon(Icons.error),
                  CartLoaded() => state.cart.items.isEmpty
                      ? GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartPage(),
                              )),
                          child: const Icon(
                            Icons.shopping_bag,
                            size: 30,
                          ),
                        )
                      : GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartPage(),
                              )),
                          child: Stack(
                            children: [
                              const Icon(
                                Icons.shopping_bag,
                                size: 30,
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  width: 20,
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      state.cart.items.length.toString(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                };
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            final listData = state.listProduct;
            return listData.isEmpty
                ? const Center(
                    child: Text('List is emty'),
                  )
                : ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            product: listData[index],
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      subtitle: Text(
                        listData[index].price!.toString(),
                      ),
                      title: Text(
                        listData[index].title!,
                      ),
                      leading: Image.network(
                        listData[index].image!,
                      ),
                      trailing: AddButton(
                        item: listData[index],
                      ),
                    ),
                  );
          } else if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsError) {
            return Center(
              child: Text(state.err),
            );
          }
          return const Center(
            child: Text('Some thing went worng'),
          );
        },
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({required this.item, super.key});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartLoading() => const CircularProgressIndicator(),
          CartError() => const Text('Something went wrong!'),
          CartLoaded() => Builder(
              builder: (context) {
                final isInCart = state.cart.items.contains(item);
                return TextButton(
                  onPressed: isInCart
                      ? null
                      : () => context.read<CartBloc>().add(CartItemAdded(item)),
                  child: isInCart
                      ? const Icon(Icons.check, semanticLabel: 'ADDED')
                      : const Text('ADD'),
                );
              },
            )
        };
      },
    );
  }
}
