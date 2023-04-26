import 'package:flutter/material.dart';
import '../controller/product_controller.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  Widget build(context, ProductController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<ProductView> createState() => ProductController();
}