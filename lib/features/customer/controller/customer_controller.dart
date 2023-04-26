import 'package:flutter/material.dart';
import '../view/customer_view.dart';

class CustomerController extends State<CustomerView> {
  static late CustomerController instance;
  late CustomerView view;

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