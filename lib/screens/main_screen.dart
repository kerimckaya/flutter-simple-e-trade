// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_e_trade_example/data/api/category_api.dart';
import 'package:flutter_application_e_trade_example/data/api/product_api.dart';
import 'package:flutter_application_e_trade_example/models/category.dart';
import 'package:flutter_application_e_trade_example/models/product.dart';
import 'package:flutter_application_e_trade_example/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  @override
  void initState() {
    setState(() {
      getProducts();
      getCategorycategoryesFromApi();
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Alış Veriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products)
          ],
        ),
      ),
    );
  }

  void getCategorycategoryesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }

    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.lightGreenAccent)),
      onPressed: () {
        getProductsByCategoryId(category);
      },
      child: Text(
        category.categoryName.toString(),
        style: TextStyle(color: Colors.blueGrey),
      ),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void getProducts() {
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
