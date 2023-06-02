import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_commerce/logic/products_bloc/products_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        ));
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
