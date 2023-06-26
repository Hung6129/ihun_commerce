import 'package:flutter/material.dart';

import 'package:ihun_commerce/data/models/product.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            widget.product.image!,
          ),
          Text(widget.product.title!),

          Text(widget.product.price!.toString())
        ],
      ),
    );
  }
}
