import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../presentation/utils/toast.dart';

const baseUrl = 'http://35.73.30.144:2008/api/v1';
Uri getRequestUri = Uri.parse("$baseUrl/ReadProduct");
Uri createProductUri = Uri.parse("$baseUrl/CreateProduct");


// Function that will be executed in a separate isolate
List<dynamic> parseJson(String jsonData) {
  final decodedData = json.decode(jsonData);
  return decodedData["data"]; // Extract "data" part from JSON
}

Future<List> getProductList() async {
  final response = await http.get(getRequestUri);
  final responseCode = response.statusCode;
  // print(responseCode);
  if (responseCode == 200) {
    final responseBody = response.body; // Keep it as a String
    final result = await compute(parseJson, responseBody); // ✅ Now passing a String
    return result;

  } else {
    return [];
  }
}


Future<void> createProductRequest(formValues) async{
  final postBody = jsonEncode(formValues);
  final postHeader = {"Content-Type":"application/json"};
  final response = await http.post(createProductUri,headers: postHeader,body: postBody);
  final resultCode = response.statusCode;
  final resultBody = jsonDecode(response.body);
  if(resultCode == 200 && resultBody["status"]=="success"){
    successToast();
  }else{
    errorToast();
  }
}

Future<void> deleteProduct(id) async{
  Uri deleteProduct = Uri.parse("$baseUrl/DeleteProduct/$id");
  final response = await http.get(deleteProduct);
  final resultCode = response.statusCode;
  final resultBody = jsonDecode(response.body);
  if(resultCode==200 && resultBody["status"]=="success"){
    successToast();
  }else{
    errorToast();
  }
}

Future<void> updateProduct(id,formValues) async{
  Uri updateProductURI = Uri.parse("$baseUrl/UpdateProduct/$id");
  final postBody = jsonEncode(formValues);
  final postHeader = {"Content-Type":"application/json"};
  final response = await http.post(updateProductURI,headers: postHeader,body: postBody);
  final responseCode = response.statusCode;
  final responseBody = jsonDecode(response.body);
  if(responseCode==200 && responseBody["status"]=="success"){
    successToast();
  }else{
    errorToast();
  }
}