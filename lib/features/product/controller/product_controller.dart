import 'package:flutter/material.dart';
import '../view/product_view.dart';

class ProductController extends State<ProductView> {
  static late ProductController instance;
  late ProductView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}