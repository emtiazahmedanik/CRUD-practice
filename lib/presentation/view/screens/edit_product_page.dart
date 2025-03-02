import 'package:flutter/material.dart';

import '../../../application/viewmodel/get_products.dart';
import '../../../data/service/services.dart';
import '../style/style.dart';
import '../widgets/buildTextForField.dart';

class EditProductPage extends StatefulWidget {
  final int? index;

  const EditProductPage({super.key, this.index});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late final TextEditingController _productNameController;
  late final TextEditingController _productCodeController;
  late final TextEditingController _ImgController;
  late final TextEditingController _QtyController;
  late final TextEditingController _UnitPriceController;
  late final TextEditingController _TotalPriceController;

  final formKey = GlobalKey<FormState>();
  late String id;
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
    _fetchProductDetails();
  }

  Future<void> _fetchProductDetails() async {
    final products = ProductList.products;
    if (widget.index != null && widget.index! < products.length) {
      final product = products[widget.index!];
      setState(() {
        id = product["_id"].toString();
        formValues = {
          "ProductName": product["ProductName"].toString(),
          "ProductCode": product["ProductCode"].toString(),
          "Img": product["Img"].toString(),
          "Qty": product["Qty"].toString(),
          "UnitPrice": product["UnitPrice"].toString(),
          "TotalPrice": product["TotalPrice"].toString(),
        };
        _initializeTextFields();
      });
    }
  }

  void _initializeTextFields() {
    _productNameController.text = formValues["ProductName"]!;
    _productCodeController.text = formValues["ProductCode"]!;
    _ImgController.text = formValues["Img"]!;
    _QtyController.text = formValues["Qty"]!;
    _UnitPriceController.text = formValues["UnitPrice"]!;
    _TotalPriceController.text = formValues["TotalPrice"]!;
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
                    onPressed: _onUpdatePressed,
                    style: elevatedButtonStyle(),
                    child: const Text("Update"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  void _onUpdatePressed() {
    if (formKey.currentState!.validate()) {
      _onInputChange();
      updateProduct(id, formValues);
      Navigator.pop(context);
    }
  }
}
