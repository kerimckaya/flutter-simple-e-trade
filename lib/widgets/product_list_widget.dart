import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_e_trade_example/models/product.dart';
import 'package:flutter_application_e_trade_example/widgets/products_list_row.dart';

class ProductListWidget extends StatefulWidget {
  List<Product>? products = <Product>[];

  ProductListWidget(List<Product> products) {
    this.products = products;
  }

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          widget.products!.length,
          (int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [ProductListRowWidget(widget.products?[index])],
              ),
            );
          },
        ),
      ),
    );
  }
}
