import 'package:crud_practice/view/screens/style/style.dart';
import 'package:crud_practice/view/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

import '../../service/services.dart';

class CreateProductPage extends StatefulWidget {
  CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
   final formKey = GlobalKey<FormState>();

   Map<String,String> formValues = {
     "ProductName":"",
     "ProductCode":"",
     "Img":"",
     "Qty":"",
     "UnitPrice":"",
     "TotalPrice":""
   };

   inputOnChange(){
     formValues.update("ProductName", (value)=>_productNameController.text);
     formValues.update("ProductCode", (value)=>_productCodeController.text);
     formValues.update("Img", (value)=>_ImgController.text);
     formValues.update("Qty", (value)=>_QtyController.text);
     formValues.update("UnitPrice", (value)=>_UnitPriceController.text);
     formValues.update("TotalPrice", (value)=>_TotalPriceController.text);

   }
   clearInputField(){
     _productNameController.clear();
     _productCodeController.clear();
     _ImgController.clear();
     _QtyController.clear();
     _UnitPriceController.clear();
     _TotalPriceController.clear();
   }

   TextEditingController _productNameController = TextEditingController();
   TextEditingController _productCodeController = TextEditingController();
   TextEditingController _ImgController = TextEditingController();
   TextEditingController _QtyController = TextEditingController();
   TextEditingController _UnitPriceController = TextEditingController();
   TextEditingController _TotalPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 8,
                      children: [
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: inputDecoration(hintText: "Product Name", labelText: "Product Name"),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Enter Product Name";
                            }
                            return null;
                          },
                          controller: _productNameController,
                        ),
                        TextFormField(
                          decoration: inputDecoration(hintText: "ProductCode", labelText: "ProductCode"),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Enter ProductCode";
                            }
                            return null;
                          },
                          controller: _productCodeController,
                        ),
                        TextFormField(
                          decoration: inputDecoration(hintText: "Img", labelText: "Img"),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Enter Img";
                            }
                            return null;
                          },
                          controller: _ImgController,
                        ),
                        TextFormField(
                          decoration: inputDecoration(hintText: "Quantity", labelText: "Quantity"),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Enter Quantity";
                            }
                            return null;
                          },
                          controller: _QtyController,
                        ),
                        TextFormField(
                          decoration: inputDecoration(hintText: "UnitPrice", labelText: "UnitPrice"),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Enter UnitPrice";
                            }
                            return null;
                          },
                          controller: _UnitPriceController,
                        ),
                        TextFormField(
                          decoration: inputDecoration(hintText: "TotalPrice", labelText: "TotalPrice"),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Enter TotalPrice";
                            }
                            return null;
                          },
                          controller: _TotalPriceController,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  inputOnChange();
                                  createProductRequest(formValues);
                                  clearInputField();
                                }
                              },
                            style: elevatedButtonStyle(),
                              child:const Text("Submit"),
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
