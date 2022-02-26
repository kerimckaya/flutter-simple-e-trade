import 'package:flutter/material.dart';
import 'package:flutter_application_e_trade_example/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product? product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(children: [
          Container(
            child: Image.asset("lib/assets/vegetables-1085063_1920.jpg"),
            height: 130,
            width: (MediaQuery.of(context).size.width / 2) - 10,
          ),
          Text(
            product!.productName.toString(),
            style: TextStyle(fontSize: 12),
          ),
          Text(
            product!.unitPrice.toString() + " \₺",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
        ]),
      ),
    );
  }
}
