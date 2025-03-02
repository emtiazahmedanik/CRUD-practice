import 'package:flutter/material.dart';

import '../../../data/service/services.dart';
import '../style/style.dart';
import '../widgets/buildTextForField.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController _productNameController;
  late final TextEditingController _productCodeController;
  late final TextEditingController _ImgController;
  late final TextEditingController _QtyController;
  late final TextEditingController _UnitPriceController;
  late final TextEditingController _TotalPriceController;

  Map<String, String> formValues = {
    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "Qty": "",
    "UnitPrice": "",
    "TotalPrice": ""
  };

  @override
  void initState() {
    super.initState();
    _productNameController = TextEditingController();
    _productCodeController = TextEditingController();
    _ImgController = TextEditingController();
    _QtyController = TextEditingController();
    _UnitPriceController = TextEditingController();
    _TotalPriceController = TextEditingController();
  }

  void _onInputChange() {
    formValues = {
      "ProductName": _productNameController.text,
      "ProductCode": _productCodeController.text,
      "Img": _ImgController.text,
      "Qty": _QtyController.text,
      "UnitPrice": _UnitPriceController.text,
      "TotalPrice": _TotalPriceController.text,
    };
  }

  void _clearInputFields() {
    _productNameController.clear();
    _productCodeController.clear();
    _ImgController.clear();
    _QtyController.clear();
    _UnitPriceController.clear();
    _TotalPriceController.clear();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productCodeController.dispose();
    _ImgController.dispose();
    _QtyController.dispose();
    _UnitPriceController.dispose();
    _TotalPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                buildTextFormField(_productNameController, "Product Name"),
                buildTextFormField(_productCodeController, "Product Code"),
                buildTextFormField(_ImgController, "Img"),
                buildTextFormField(_QtyController, "Quantity"),
                buildTextFormField(_UnitPriceController, "Unit Price"),
                buildTextFormField(_TotalPriceController, "Total Price"),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onSubmit,
                    style: elevatedButtonStyle(),
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _onSubmit() {
    if (formKey.currentState!.validate()) {
      _onInputChange();
      createProductRequest(formValues);
      _clearInputFields();
    }
  }
}
