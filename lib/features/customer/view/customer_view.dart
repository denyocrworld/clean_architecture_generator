import 'package:flutter/material.dart';
import '../controller/customer_controller.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({Key? key}) : super(key: key);

  Widget build(context, CustomerController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
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
  State<CustomerView> createState() => CustomerController();
}